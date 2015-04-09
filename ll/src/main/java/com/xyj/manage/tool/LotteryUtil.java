package com.xyj.manage.tool;

import org.apache.commons.lang.time.DateUtils;

import java.util.Calendar;
import java.util.Random;

/**
 * @className:LotteryUtil.java
 * @classDescription:抽奖工具类
 * @author:xiayingjie
 * @createTime:2014-4-1
 */

public class LotteryUtil {
    public LotteryUtil() {
    }

    /**
     * 获取抽奖概率
     * @param prizeFactor  剩余奖品数/奖品总数
     * @param probability  此类型奖品数中奖几率
     * @return
     */
    public static float getFactor(float prizeFactor,float probability){

        //获取当前时间
        Calendar cal = Calendar.getInstance();
        float time =cal.get(Calendar.HOUR_OF_DAY);
        float timeFactor =(24-time)/24;

        float factor=timeFactor*prizeFactor*probability;

        return factor;
    }




    /**
     * 获取随机整数
     * @param allCount 总数
     * @param count
     * @return
     */
    public static int[] getRandomInt(int allCount,int count){
        int []iRandoms=new int[count];
        Random random = new Random();
        for(int i=0;i<count;i++){
            iRandoms[i]=random.nextInt(allCount);
        }
        return iRandoms;
    }

    /**
     * 获取一个随机数组，此数组的元素在指定范围内且有重复值 
     * <br>注意：3个参数应该都大于等于0，且end > begin，且count <= end-begin
     *
     * @param begin 最小值（包含）
     * @param end 最大值（不包含）
     * @param count 数组的元素个数
     * @return 随机数组
     */
    public static int[] getRandomArray(int begin, int end, int count) {
        int length = end - begin;
        if(count > length){
            throw new RuntimeException("IllegalArgumentsException: "
                    + "\"count\" shoud NOT greater than (end - benin)");
        }
        //顺序递增的数组
        int[] ori = new int[length];
        for (int i = 0; i < length; i++) {
            ori[i] = i + begin;
        }

        int[] array = new int[count];
        int index, temp;
        Random random = new Random();
        for (int i = 0; i < count; i++) {
            //从ori中随机取值，赋给array
            index = random.nextInt(length);
            array[i] = ori[index];
            //把取过的ori数组中的元素跟数组中的最后一个元素交换位置
            temp = ori[index];
            ori[index] = ori[length-1];
            ori[length-1] = temp;
            //数组长度减1，下次循环将从剩下的值中继续随机抽取
            length--;
        }

        return array;
    }



    public static void main(String[] args) {
        //获取两次抽奖概率
        float af=  getFactor(0.1f,0.3f);
        float bf=  getFactor(0.2f,0.7f);


        int a =  Math.round(af*1000);
        int b =  Math.round(af*1000);
        int c=0;
        if(a!=0&&b!=0){
            c=a*b;
        }else{
            c=a+b;
        }
       if(c==0){
           System.out.printf("已经无奖品");
       }
        if(getFactor(0,1f)>0){


            int []ar=getRandomInt(c, a);
            int []br=getRandomInt(c, b);

            int []prizes=getRandomArray(0, c, a + b);
            System.out.println(java.util.Arrays.toString(br));
        }else{
            System.out.println("已经没有奖品");
        }



    }
}
