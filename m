Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756949;
	b=1xYu9TY3eYdrzrHRjUeTWk/b9Ly8yNeLq3x6UFUMlP6CWN2zZ/OUhcm5/jMXZ+cjh9Ky
	 H8TyDe62BRsCGxZviNvOX5S7E/Mp9PvmQDVYVD6boIR9YAx5TFMc4Op4bWwCvpDpXyOXL
	 OlflvoB7D7+srxUyLgsBAcusVhma5sXmnZM3uqeqEShSYJitK6PkN/cT7SvwiqqYl2xXs
	 ynPFL3VhyjmcOg+b7No6x0qcBaxrnyOCFNhY98BZfSX6FZagnmtO6ZDHpkSG5Ug2NLnXS
	 vX5LFNW8aYOQMuB4VxnlJEnqk6GZUrE0/9YYwlr436AE7I7IwjXdpQ+VybgF0qCOhcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
	b=G3l93N56SckeqZiTGJMVB3DwwdBFENfL0VJfFQTWLIM4LPq1C1Nm+IFz6xoX4K3E8E8+
	 eaYbenXAxsdq3hKiQx3UZOTAvLRmrFnpPhGP852eXYdOW4yD8OYOXnO8mq6Tk8yEuWKLS
	 ykEJ2q8rdthvlukl9C6pkBzcU8aeGRIPI7INuf0pd4nmp/XBwn8lln4zBM3YAO5yRofRj
	 o6C/uNEMMbiX3Rt7OTmvhuU0lvRQb4QXOYSeQcf48zW5YHvRSoTbqaLcrNLLfMtzPMoxo
	 rzppYpMB0DkeX3pnITvyUSbUc8hfPtRFSjLsHEzd7dIp3IbRRhwGOnk2QquL6TEvCcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgouW7ox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRPnFzUa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452A606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 12:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6452A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgouW7ox;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRPnFzUa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAT7t3560858
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 12:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=; b=ZgouW7oxVzfUAKZQ
	KOU0IWzlrr6Dubt2hR51UJT2qwDOEn+P6ShzEQm7KKeqvELfky49nvxULxXPo1sO
	MRBbZixXOE47+6dGMHosulbGpEn7aFALGJfApvVx/IJF96X0byW9h8SUmaOVobIV
	c06BsVXT9FIc9iP/8y9aSmzRp32MHWOHr5gVxuEYhsXVpP8ZV53NnjCa9Amlv/7c
	sLd083BmST4gquvl5Vaj3M6QwL3S7zE5y+ebEBeFdzRqPQlg43Pm7CA6GeTAu0cg
	HQWrgG5MInG7+AkPjKOAEHCYmirtmCnuaQyUZP0MbQDZqQMVnLcymKzA8eS45pV2
	BU8Yqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpbhpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 12:02:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9572e892dso6524435ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756948; x=1793361748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
        b=jRPnFzUac6Y+otH03O5xqV0p8ENvHTPutfPKsbU28IxROqlXa4kX1IGeTUCoR/1bXu
         4epfxGKe2GEo+jdwt12U02vWewVmJLYBTALPumVDbwGDPZsKkr1cBcKiwisM4+/8973P
         egtJwdXxoQvArP4DwyK4iTi/e8O6cTm5MFXvWsnyunfkSpeCzZLgQf572xBqTfRtBNoJ
         9nt0Xp4cGUtZH3Exeyud3l1VABYy2uYbaDhaOOih2BP8BxrODKbM3WW9YM3HdZ4E2Ila
         aNB2cnlU7qfgPY2NYTtStCQvCf4kxhID3NLG3Nn9Y7t0E0kcPs8sMy8yXF4+sbv8/2aF
         oEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756948; x=1793361748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
        b=f/AGOh6uPZb5j1v/AmuiBd8hiadPKIrNGbdYKUtSzufq9AJwtUVNs4LykyOZNj7qFN
         VEgUgxdOgYUGCZfmtPdBHosuHUnlCIF2QFaPvTX5/GrOUnZCiK/XzrlOgnfARQRCn967
         5TTImEUQMBIep6EFHDiiPvhqlMH6og9yFRQy8MmzkHXA79OVYqUYwkzl2sJ70ujw8wtU
         gwG8YW3AlU99w3nNJoiEKrlsBRPzQT5gNAaZqfCrteTa9/7rQTFJCF9PafzglMDX2fkL
         uIlocReD2/ngN/0URsGfBL6H0hR+dOUU4BCiwzfPyllQO3o6I1kABxCP1zihkdFeVMNj
         HJGg==
X-Gm-Message-State: AFq9FYI5VMlncpH8/tV7MknYr3aFLK0SSPbwbb/EG+wRLamipE3nwFQk
	QkAXs/zmE+fQvdm3jFjE4VHedRJUy7zv6NpuHPDGTbP15A3mX4Sd2h6KOIUdf84tz/sGnOYz+UE
	nsPNdr6SaUCytgrFNe3ORXms7Ws0tAIq+rJ0nvjyMOMSMg0I0lkpnS7LwywyYURwzM29f3/AGKl
	WekYE=
X-Gm-Gg: AYBFou3ApK91umvAVwwqniI6Q1a/2xTae54qkvUHk37v7DgG7+BBTkdxMSW/GTF0AlN
	guqIklj8QWK2WOZWF7Rwj8l7G6GgI2fu+fynMpJauxtK7fMGf9/RRUrZowlxmgE5wGd65kb6fe3
	i5BHAhuz9G7Q3E+/7HqTsyKMryuezP3HO/fVdA21fuFcig6B60tgZXB+jwX6KRCsR6QAL8OlMDQ
	RjhFeW8ZyDz7f/+ootTZ7UwxlMky1isz0HvAl+AFN+DI8UMr5Zw0gO+UHF7qHUKbWNui13NXGNY
	YuZedIxUOx8annzy1w/XgHHYiDC5ZcHuGs31K3KmrHXBFp4MNGB3HKo+kWXIMIzTREiT6deVy2B
	Nuj0MIQVkBFxpGkO2skEEgk1k4b56
X-Received: by 2002:a17:90b:1350:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3adce136cf1mr1516500a91.61.1792756947581;
        Fri, 23 Oct 2026 05:02:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1350:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3adce136cf1mr1516163a91.61.1792756942520;
        Fri, 23 Oct 2026 05:02:22 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd6c20fdsm41656a91.11.2026.10.23.05.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:02:22 -0700 (PDT)
Message-ID: <a8db08bd-a92b-4c8c-a9b0-0a637b57cf0f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:32:18 +0530
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
Subject: Re: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171157@kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171157@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX4K4PHJFaJ9or
 PkVNLoUU4dx1u2sUg91RLFiVZFEN092wOzO2jtKp1eKlTvx4AnqyZHxObWEk0ctZCDlydnGUQVQ
 Zj56dmwJqrnd5eoXwoBsCe4xG/nKcxk=
X-Proofpoint-GUID: XO5urKWWD41D-q1jklACKA5IVopQMQoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfXxV3+fAonku7Y
 JH13nE1UIUVUUV65VzQKmFf2UgaIO4VEL5GJjbshmoNPukVcOajo9i0hWhfaeL22l6mYKjIrY9E
 zSc6yHuxOEz6hhDLVYxlr3AcPF7cfpjReUMRScm/gx4owlymgk/AClgzXff4uqmArScLhuEj8zH
 0ibU16hZcXd4EwyFou6g94FVZcYvyoiwlreTJvHsH4NXwjXvMMsg/OtHVmH+teveJt2YpF5MI6s
 ++w0I4tpHCxUBLfFklqaVf1g1OWskQC1IRBpRqjQTphXNFFFKn9NSB4Ttgfto7OP/AWWy/m9d3h
 vEQDnBmS/8/m9YzZgwTIzbJ6NdyFv95IMWLJYLMMaCcL1kAWD1/hooel2gXvkQqvMg4hPdpDPXf
 B/u+2yDEAKOkyvSRCtManE3H0of6kRJDlCL7tixB1UU6TSMnjDxUS71bhH58AP1xgO+CAd0r1R7
 8cGe0IQCvkcx9p7jIbw==
X-Proofpoint-ORIG-GUID: XO5urKWWD41D-q1jklACKA5IVopQMQoT
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb4cd4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=b4OPtKER6HTDepoTwoAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

> commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Subject: mfd: qcom-pm8008: Drop GPIO support
> 
> This commit drops the GPIO MFD cell and its associated peripheral and IRQ
> definitions from the PM8008 driver. It removes the GPIO elements from the
> peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncates
> pm8008_periph_base[] to 2 elements.
> 
> [Severity: High]
> In drivers/base/regmap/regmap-irq.c:read_irq_data(), max_main_bits is derived
> from chip->num_regs, which is now 2.
> 
> Due to an off-by-one bounds check, if bit 2 (the dropped GPIO1 interrupt) is
> set by the hardware in the main status register, the check "2 > 2" is false:
> 
> 			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
> 				if (i * map->format.val_bytes * 8 + b >
> 				    max_main_bits)
> 					break;
> 				ret = read_sub_irq_data(data, b);
> 
> This allows the framework to process bit 2 and call read_sub_irq_data() with
> b = 2.
> 
> In drivers/base/regmap/regmap-irq.c:read_sub_irq_data(), this leads to a memory
> overflow when writing to the status_buf array:
> 
> 		reg = data->get_irq_reg(data, chip->status_base, b);
> 		ret = regmap_read(map, reg, &data->status_buf[b]);
> 
> Since status_buf was allocated with size chip->num_regs (2), writing to
> data->status_buf[2] corrupts adjacent kernel memory.
> 
> Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
> drivers/mfd/qcom-pm8008.c:
> 
> static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
> 				       unsigned int base, int index)
> {
> 	/* Simple linear addressing for the main status register */
> 	if (base == I2C_INTR_STATUS_BASE)
> 		return base + index;
> 
> 	return pm8008_periph_base[index] + base;
> }
> 
> When index is 2, reading pm8008_periph_base[2] reads past the end of the array
> because it was truncated to 2 elements.
> 
> Can reducing PM8008_NUM_PERIPHS lead to out-of-bounds accesses in
> data->status_buf[] and pm8008_periph_base[] if the physical GPIO1 interrupt
> still fires?
> 

I checked the HW documentation and I see that the GPIOs of both PM8008 and
PM8010 are not capable of generating interrupts. GPIO1 is used to send out
interrupts from the PMIC to the SoC and GPIO2 is used to reset the PMIC.
Since they would not have any bits in the main interrupt status register,
this issue cannot happen.

Thanks,
Jishnu


