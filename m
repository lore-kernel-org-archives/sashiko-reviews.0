Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DB39A808
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 02:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600305; cv=none; b=JrFxMnyI21E/xnmmhIrhezuLNwtsOSDMJUDljGU15VArr56DPJuTw6GpiJzcwO1g36OLb41oeKp4EmntcESe8+DRZtNS1kSc/dWUpeR6D1Q3L+7SeTJ+M/h0S7bPCqxTaGaDNOJOxyljcVVldDuslHqioYnCq19zoUh/2EnZ+z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600305; c=relaxed/simple;
	bh=oeNvN8JaZndlATLMPSf/BWa2wDJxUBqOZUBHSJzcdbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdKa/8yuum5hLnzG/qCyOOSZOCrRaLVunz9KKwudRj/mbF8r2jBrIXNyeSKpVYEIU6M8+XiC1w28vhx1mn+vECAfilq7n8sIbUpTRV7CIww9sc1udLo0KC7QAvMurNMNJti31HlEvBzWUIAhKsgyHmnxZLWeVyWivmqKEFF861Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esUOpHTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtIxuIZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esUOpHTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtIxuIZv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eYiu4126847
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 02:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBcjT05yfbliSeSLqir1H1hI2BWg8y5p7+FWfWM4sKU=; b=esUOpHTpeOeIVi9g
	pN1gyNAoX+09M7ACmGAiJH6+gYwWvXc/iMQLLln8B1TGNkBQzkGxDwOqc8ZMwBYK
	rAMNGxW5OVFJfQx4rt9uW12D9bT+jD84h6eqBPRZFJOdQBM0Z71rIVxBFbzUsgaB
	ohwMLv/KvLt+e6EG0/2vjYKgGv2OhYJ3zpIqZtofHyl7TFb8qH6wyJT4TeGr6eB1
	omxYxAU3VvCgh20EQc7Aq5MFHomrY0ndFx8hA/uL9v8Wsylxrr3SCrnePUkIzkOy
	+noA9Kbj3D2YAwvE++uvG0pCJrr/fhlnSFIxFbKRq1HUzbex0QFj2yFeymmrJGhu
	Y0lVTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8hha4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 02:45:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso512154a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 19:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791600300; x=1792205100; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBcjT05yfbliSeSLqir1H1hI2BWg8y5p7+FWfWM4sKU=;
        b=LtIxuIZvqoAyatQx8qW8EjLL8Ytoi3ahtE5aAnlcBkMprlSqTr/vNd+KJqU3XP99Qs
         cP/v35RLd3wuIt4fo5FhScqk5uY51jcf0lZELvJzti5HqcY6RU+N20t0xA5tehHeG+1D
         jrZaZdVoPO49LQrxNmgXY94tnnNNIgMrb+N/sbbB0wpdyML3oySpmg/JoKF83Uxx+alo
         W7C37HJ8mbwg9KO+zEuD7eVFVcDeHuAXqT8AjZELzxYF0edw/rmE19qwwsjeLsv3iXFQ
         K3pnEgPSeyo9E2VgWsBRcyoEqidl4nGoJGcO6HDViJUSLe6Iy0HgKZ69z7tCdUeg3RFy
         PSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600300; x=1792205100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBcjT05yfbliSeSLqir1H1hI2BWg8y5p7+FWfWM4sKU=;
        b=Yy90EoQD3HlRSoXLk+WuiiKaLjz4LbgMWKmYSOg9nvTsvylUb5Sg/ROnY2nVziSp1s
         Y9SL9UIrbfeLguqEkpDtJNj0N+EN6ntYoHX/KtwAEbs/Rk8c1fKUuIsRNOeigoROhmZ4
         wBq+UbLPr/ZhUfAC0+U5ccA+cxLItZeAKBi9SDiiGNQ+Kw6zj4qIjYrXm1RFULAxGi7t
         Hwx/I406G+3IbDMiR5A+aFGb4EC2t3uEB6+RX0dbkyIeG4VkE5mc0R69p8j4MKhUShCk
         Xc3Tyzi1ILiFJuEXEh5uHvgcKLjibHJ1lcb1eJylvqpMK3pgqOf+hcs5skHyN318F3zn
         71PA==
X-Gm-Message-State: AFq9FYL0ofbmsdRkAk7zc6b9MTgCVGL8GTuySvLG3BCr3Fiyuh0sar4q
	0jBeFfuQNhaF20FPQdR7ZKNrH0RaRm5K+owGz83279T+WbcAQ7vd54zNJNlvB0m48s4EFwIjf4D
	ohdpW2Tgb3zEjvzNBhvWR6wOqvDPZWcZHcOHKMjN9XRI0wKW4XxX9ZzvcqY4WBPJj+1aaJjB2IW
	TDSBs=
X-Gm-Gg: AYBFou1ctHAGGrQwmhFJOYMYBY4XHYyH8ghXt8V4QrD6DhMVDmUnPy6EsI6GpF4Osxq
	YO+Mrgzubf2zJwMqCsgiKTOi+AxJ+xj8smrN1lS2h7CgZ0KKwqhM7jZZZAWsZ+uY44hoxk8OuGZ
	snmqxcBjbzwsSLdK8n1YKt//DEAOahAtzwelg2vcP05+4dyF1575wXwsQWEUCSOGCI0U10yjwAS
	BOedlftc1uSC0Eg5HvbWU6u1OQ/bqxfZW0NGJA8hC3ldwaj2I9eZZQTanPBEFtJ7LHFQdN7yjqt
	cJjjo6eJQpdDJx64qMz9nsFBsMAJl0czcB/+oNL+l2d/QiCQvq5ge436H/fMe0kZsLol6Z1rizL
	THw3jiisOIQvmrav+0PUQ1yCQ
X-Received: by 2002:a17:90a:e7ca:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3ab3a8ce801mr3460716a91.36.1791600300293;
        Fri, 09 Oct 2026 19:45:00 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3ab3a8ce801mr3460699a91.36.1791600299701;
        Fri, 09 Oct 2026 19:44:59 -0700 (PDT)
Received: from [192.168.1.227] ([183.192.31.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm1896587a12.31.2026.10.09.19.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 19:44:58 -0700 (PDT)
Message-ID: <702b0ccb-6b33-4108-a4a5-5e9a2181514e@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 10:44:55 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 07/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 QM configuration
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-7-16caf43e44ee@oss.qualcomm.com>
 <sashiko-outbox-165734@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-165734@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMCBTYWx0ZWRfX2dN6Xe7mNC56
 7zOM8QLyhL33OwkgKCi87liCKoSuvZJz18mFwq4ipmUXnGAVzXQu5N7InaOGGEbyjjJIVzqIxMn
 C38e9UrJuYV3fFIIME4sMr1brG4fb2Q=
X-Proofpoint-GUID: jWNM_iMIJd2mhtpQl9ArcuV3thMYBXKA
X-Proofpoint-ORIG-GUID: jWNM_iMIJd2mhtpQl9ArcuV3thMYBXKA
X-Authority-Analysis: v=2.4 cv=AMIlxa6n c=1 sm=1 tr=0 ts=6ac9a6ad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=N18iw5ntM+1D/B/PUaPCgg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8gpwaHf9ndjPn5a6IY0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMCBTYWx0ZWRfX/HC9ppYRkLpZ
 p/tm3CAEiF7fU4+Sg3Qx2+4adymUBdIwKaiyES8smemAPwTgQTyBJOsoUKCUk0FRnkIA0ssQRq8
 YtyBP4nYHS9A/cBApbJCQ3GfF5gJ56BChEe3ST8FSB/8f/vE/lk60rEGN2Qn+xKTVv60o9KZLUB
 NfgFygl8JPhUncBuUqByh4UPC44887mv+fw7zifbfem8hZFH3aLbD98pUamzD38mfrAf3RxqZpX
 xVduJ8rCAnll++v7uqo5QvG9oSZ043UxF6lgN6VTZQqU0YklP4vcaR4KX4wKMgmqw6mAdLtSAm7
 TpXTA+ueB9GjlvNvUrnekxnYBUhX1xx13DmqLW/1yLtRNqZ48bznuDw8OQgtSGpFux65rcl2exD
 G29Iq6wbQ4P/LYhQ1kAKVqsC+uwYWxkyL8e2emxpl/UEmqI1Fl60uEamjhtimULwbkephVtdlxH
 tXobhUPM6hGmBYyyopA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100010



On 10/9/2026 10:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ppe: debugfs queue counter iteration reads nonexistent queues on IPQ5424 causing bus errors
> --
> 
> commit 4fb437e4b3cf979efa2cd54481de8f5ac5e4963f
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> net: ethernet: qualcomm: ppe: Add IPQ5424 QM configuration
> 
> This commit adds the Quality of Service (QM) configuration for the
> IPQ5424 PPE. It configures the unicast and multicast queues, noting
> that IPQ5424 has fewer PPE ports and thus lacks multicast queues
> 284 to 299.
> 
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> index 3afa571193238..dec8eed772539 100644
>> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> @@ -314,6 +314,37 @@ static const struct ppe_qm_queue_config ipq9574_ppe_qm_queue_config[] = {
>>  	},
>>  };
>>  
>> +/* Multicast queues are dedicated per PPE port. IPQ5424 has only 3 physical
>> + * PPE ports, versus IPQ9574's 6 PPE ports, so multicast queues 284 to 299
>> + * are not available on IPQ5424, and the buffer pool assigned to the general
>> + * 'group0' is larger here, 2010 versus IPQ9574's 2000.
>> + */
> 
> [Severity: High]
> Since multicast queues 284 to 299 are not available on IPQ5424, will reading
> or writing the debugfs counters for these queues cause a bus error?
> 
> In drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c:ppe_queue_counter_get(),
> the code loops up to PPE_QUEUE_TX_COUNTER_TBL_ENTRIES (300):
> 
> 	for (i = 0; i < PPE_QUEUE_TX_COUNTER_TBL_ENTRIES; i++) {
> 		...
> 		} else {
> 			int mq_offset = i - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES;
> 			...
> 			if (mq_offset < PPE_P0_MULTICAST_QUEUE_NUM) {
> 				reg = PPE_CPU_PORT_MULTICAST_FORCE_DROP_CNT_TBL_ADDR(mq_offset);
> 			} else {
> 				mq_offset -= PPE_P0_MULTICAST_QUEUE_NUM;
> 
> 				reg = PPE_P1_MULTICAST_DROP_CNT_TBL_ADDR;
> 				reg += (mq_offset / PPE_MULTICAST_QUEUE_NUM) *
> 					PPE_MULTICAST_QUEUE_PORT_ADDR_INC;
> 
> For queues 284-299, this calculates an MMIO address for non-existent logical
> ports 4, 5, and 6 on IPQ5424.  Does this lead to an unmapped register access
> and a kernel panic when a user reads the 'qm' debugfs file?
> 
> A similar unconditional loop occurs in ppe_packet_counter_write() up to queue
> 299:
> 
> 	case PPE_CNT_QM:
> 		for (i = 0; i < PPE_QUEUE_TX_COUNTER_TBL_ENTRIES; i++) {
> 
> Could this also trigger a panic when writing to the 'qm' debugfs file?
> 

No issue here. The multicast queues 284-299 are not functional on
IPQ5424, but their counter registers still exist in the QM block. They
are part of the register space allowed by the IPQ5424 regmap, so reading
or writing them is safe. On IPQ5424 these counters always read zero.

