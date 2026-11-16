Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794805494;
	b=vqieHpAjUOEWubfY7GBvZ9Lhche2D/d3igtQYpuh9Kr6rMQinh5HmAgQlX9QoDp1Pg/+
	 pqNt5mXnqfrCHjdwnrTIawf8sFWtKNd68CdiylwArn+jV8WHaT7Pa37PvrUAVU765NuLa
	 TMdRwBBQgU1t/JV7Suqi6MgVfIVJC6FsU8Db34bZuW05fXx3aRv2nORMWTaPYelKVWUXc
	 qF0LcUvfbcc44t4zSmm9G4as7y5Act5oJoBosr3hwEbCEqPscB8sqKIzyWndpylRevdYD
	 D/nommyGJJMy7NaiZTx+DpyB4lh0kMuXW9YiaQkIP5XncTi/NLhBIAO9MlXiRm+Kpjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ryPRF0HdNf6rgI2MrobrFyqzSxq0mqoFC9JGQuvWcFA=;
	b=zjEQqaS6gOZTJofg/j0X6+O81HEIDIcDd8ImlB1/DR/vfW2x7tMYETi60M1DZE4uukk0
	 yzjtlZ5kjaWdbA22OkyO5X8iLfKzzOLwWcWeMMUFJXwj6EPVKp42+w7u3jWDNsWP3pblh
	 J4h5P9tdFFtLlFQhjzKa6i+moHiK+tQxJJod1Sh7TTjgr5U/oYl4bchCXiYwpfgW83ZMm
	 nl5Zr2EEX0cpJ02S/gnk4OOSvFo47pNpv6sigXNdszmU4WxszyEwAjG6DaUl0JRYN8I9f
	 VSgKsHPMIi7yNI3bwdfnz2uHOHg9MnthoSMiePNXBkt/W/k6emI0p8qCMVyjrANv1Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mdfEK7jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9BEXMrf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C3606A323
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 05:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F5C3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mdfEK7jt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9BEXMrf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG4RdOW2114268
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 05:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ryPRF0HdNf6rgI2MrobrFyqzSxq0mqoFC9JGQuvWcFA=; b=mdfEK7jtVp1wweF8
	do9r/uilJDDcS2RIC4uMDN1Pv0THRYmLr08kde4N/55LEmS8Tu8X0+xMqbcf5usU
	tGYPS8IAtLR6gkP1vysiP3aCyTYVptkILrs20ZCa024aBa9z69Tc0WyVt9OPFPmL
	osu213cxB5fCh5XXi05FZxIf2FQZ3l2ORM+fwCESgCcXSoKeqX78hJse4zbZ9fn4
	A2pVNF/eG9T2X9523+0lMZUuZUcSX1wToyC14F4IFudxW46dqEqWzVBcNFLB2a3J
	Ev6Qcl3/c4tDf0JXXw81tf8wDfih3vPQH+gDQmVk0uLNsxH/bYiZMwOaKOSK9Cwr
	VXlkQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8vqvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 05:04:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1513923a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 21:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794805491; x=1795410291; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryPRF0HdNf6rgI2MrobrFyqzSxq0mqoFC9JGQuvWcFA=;
        b=f9BEXMrfJ72EtmR2oP6CYkljxBUB5kLjKBQr/MyFvitYT0yh1tf/C59H4Ndp2uYDMZ
         IZXV38eEH3TRG3oTkGSDuaxNgS1u56eRZsTnOZvpIRlnVy+2wtr2ns4RUzYQjDQWXtWf
         VF3CmxPTi44ILfBUYE0T1LQTokLVsHNPL9rXhm5BUf2nygee+H2t75KgHSqAj9YECMpu
         qoEZjYEwfUf0pDlG0mwNs20ldzyoTH9r+qGupvz8Bmiye907MaQk5ogseT/grgVumFzt
         Zknyguy66FWFlcpjcEQp9TAV7E9cmIG2oDJagHgDUNsSziCfYu5Q2vpxu06vsh/IVsk3
         HyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794805491; x=1795410291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryPRF0HdNf6rgI2MrobrFyqzSxq0mqoFC9JGQuvWcFA=;
        b=qHgTH2FXXPQMfhh+9pmzuLUaOEmKfpC0cZ6GyoHi/eEW0J7cBMnn/m69MwIwxecmVo
         LLwDbIjoB0Fifouw0naCYw9/Pqg93otggSTuFJRYG9V7P8vpNaLA+RZVNWK5BBi/CnzB
         PKsXbF3KFQQE/sTYwnMR+DheXE3MkCksD0jvFcI9wNakXBEaqNBQ3g03XFhAHUyEFQYe
         fyfQnwNRDswve7Jv4HPezFs6m1qwDkKykm6fk8wBXVc81ezkpahelQL/MyS3/uL4neS0
         n+RgOIL+8DqKZOaleobHu6Ggh405cSfQ2ueC0ySFuQ/xT2C13/e5vAvZxeosXb0mPPHq
         4TDw==
X-Gm-Message-State: APuU4Z81vJKH5ZGxm/LpuXwcGnbXck02ckHuANpBMKEPaPJ2Bpiotm7Z
	32nEN/y5D5HvE/r2ohHHKUELsetElk0TI5r9hE9MY8EST5x4AswlmvmTed4KUx2yZJ+6hnGhAtu
	eRCB2R4nNrgZ2a5BxeUIk1eLz4cKqUus0w6CMLOFfg7fIMazswx/mVi5HXID4Gv0ZAsmFA5sHg5
	l8M1Y=
X-Gm-Gg: AYBFou2+RbsAML/0xGaKNqiA6B7lWyvetpP+nXcMVqWiD892ZFghIEXhbSY7K+ql/zl
	PL9NTjSMWNM+hyjLM84kD9OwNXOyN1NzEwSd/Lgb6AyCgSLl8EwHOth7QlKOY2td+D4joDuOdJA
	xfGwiTBcoZ8M0+v5MgAKuMQtag8cKq44cJHbIW6D0CtSyCKWaxFmpSs0s87hvHuHpUEs7TE2BPT
	mOO83lf92JS7ild17PzvVT24XtjS+NZpUBq1JRBQ6VQ4OkNN16isBw5GVKlic3s3UyOHKPNZItW
	1VsNMDpfqxjwa3pZBA1Dss41lJKfNbcjNL370SUQFkvNoY+4cT9ERz75JaTAWlb+erqdGdPX3R6
	oLK5HpjxCJyyMhlB6+6FcVyGGkE1fKTVvnZ1wbWhQt/284d5t7L3eVQZ3iUhikt+pV1KhD5oARZ
	KNUdcyLg==
X-Received: by 2002:a05:6a20:6a08:b0:3dd:85a8:4c5d with SMTP id adf61e73a8af0-3f7a7ac81c0mr9042109637.36.1794805491322;
        Sun, 15 Nov 2026 21:04:51 -0800 (PST)
X-Received: by 2002:a05:6a20:6a08:b0:3dd:85a8:4c5d with SMTP id adf61e73a8af0-3f7a7ac81c0mr9042071637.36.1794805490539;
        Sun, 15 Nov 2026 21:04:50 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6db53sm3176286b3a.21.2026.11.15.21.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 21:04:50 -0800 (PST)
Message-ID: <e60fc1f0-b920-4b40-85c0-e7af1ccba98d@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:34:46 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
 <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
 <sashiko-outbox-212526@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-212526@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa8ef4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pMX85SVGjE-Xmla17LoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxOSBTYWx0ZWRfX9iEVgyOyZFSQ
 haRg6W42Q3ZHm9xx4eT5/IbiV+Xzz0pwiT7LOQFi4bbhWphbnkQL8z+h9foOzheqMVIcny4skub
 28iQzko6HYedGDoQ3TGDXlySy0Us7g4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxOSBTYWx0ZWRfX8HjZ7W4R06eE
 UvL1q+ny/pV3JhfkwBHvIJLIYFSAo8RkLXeXZ2Yxmub3HE8fwDFvOGCKUV+VNOzih9zm+q1Qp6E
 K7F75m+jqCDSGJdT9ss3tjh7oxmBjfvp++T+39r6pkAW5XxPfr0X+M65K3Chkcp5dsRjy7Y6hH0
 F7eYyzSEBX/4ef2hsVbwxpDzVLlawXdPAhtt6kjAZkbLh1huI90bqjb2xu3sisPltGvZTKhOhro
 PkfvgWN/GLzrXKngOEajkFdp/vEqkziU2fbK+nTqdlDDHTIq//y3uxHxi+mq/CSb8ZAP0l8w65b
 E1x0DLaKy2Nx9fz6UhIt7FaNLpUPMgVWo5l1GWIYfU72ShuEqoXSbU8spcl8paoKp7iwi8TKzA3
 M2BF0TH7BqWDJjDHLaztHZLXPja0f7QjtdcdyM3RqslJ67unlimvpb0hRszwc+n7qp/xlS7DApp
 8y0X9Q+/IFMxSRN2sXA==
X-Proofpoint-ORIG-GUID: 5lEpBQChUDdN42vHsihPM-BFC4--3D8j
X-Proofpoint-GUID: 5lEpBQChUDdN42vHsihPM-BFC4--3D8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160019


On 13-11-2026 02:44 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: wwan: qcom_bam_dmux: lost PC edge in bam_dmux_probe()
>    with IRQF_NO_AUTOEN
> --
>
> commit 4515119c8a0e425457d7366d017600d0d4e872df
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> This commit assigns a restricted DMA pool to both the local and remote
> execution environments via SCM when qcom,vmid is present, reclaims the
> pool on teardown, and defers enabling pc_irq until the end of probe.
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index 1479f8362e04e..04f3d46d4c3f3 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>> @@ -821,7 +913,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   		goto err_disable_pm;
>>   
>>   	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
>> -					IRQF_ONESHOT, NULL, dmux);
>> +					IRQF_ONESHOT | IRQF_NO_AUTOEN, NULL, dmux);
>>   	if (ret)
>>   		goto err_disable_pm;
>>   
>> @@ -838,11 +930,14 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   			bam_dmux_power_off(dmux);
>>   	}
>>   
>> +	enable_irq(dmux->pc_irq);
>> +
>>   	return 0;
> [Severity: Medium]
> Can requesting dmux->pc_irq with IRQF_NO_AUTOEN drop a power-control edge
> between irq_get_irqchip_state() and enable_irq(), permanently inverting
> dmux->pc_state?
>
> CPU0                              Remote modem
> bam_dmux_probe()
>    devm_request_threaded_irq(...,
>      IRQF_NO_AUTOEN, ...)
>    irq_get_irqchip_state(...,
>      &dmux->pc_state) -> false
>                                    toggles pc line (0 -> 1)
>    enable_irq(dmux->pc_irq)
>      smsm_unmask_irq() / smp2p
>        caches remote_state = 1     <-- edge lost, pc_state stays false
>
> With IRQF_NO_AUTOEN, dmux->pc_irq stays unstarted in the underlying
> Qualcomm shared-memory irqchip (qcom,smsm or qcom,smp2p) while
> bam_dmux_probe() samples the initial line level and handles initial power
> on.  Neither irqchip latches transitions that happen before enable_irq():
>
> drivers/soc/qcom/smsm.c:smsm_unmask_irq() {
> 	...
> 	/* Make sure our last cached state is up-to-date */
> 	assign_bit(irq, &entry->last_value,
> 		   readl(entry->remote_state) & BIT(irq));
>
> 	set_bit(irq, entry->irq_enabled);
> 	...
> }
>
> drivers/soc/qcom/smp2p.c:qcom_smp2p_notify_in() similarly updates
> entry->last_value for all bits while only delivering interrupts for bits
> already set in entry->irq_enabled.
>
> Because bam_dmux_pc_irq() tracks state by toggling
> new_state = !dmux->pc_state on each edge rather than reading the line
> level, missing an edge before enable_irq() leaves dmux->pc_state inverted
> for the lifetime of the driver, breaking power control and DMA pool
> reclaim on remove.

Yes, a PC transition in this window is not seen, since the SMSM irqchip
resynchronizes its cached state on enable_irq(). This was a known trade
off when moving to IRQF_NO_AUTOEN.

Making bam_dmux_pc_irq() derive the state from the line level instead of
toggling, and re-checking it after enable_irq(), would close this window.
This changes the PC handshake on all BAM-DMUX platforms and can be
addressed in a separate patch if needed.

Thanks,
Vishnu

>
