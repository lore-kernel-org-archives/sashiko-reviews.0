Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310B4E36F1
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889239; cv=none; b=DInT9zlXkIh26geJSVe8JQYNvnHMLYS5ETzENcu3HoSlVpWI5XnwIqfA5PNbtYLWD5yWkSdU1KRRxSEZ6IUWFPDg6ghdlgdmougAUkxlG4rbINgjokQyxs8mueNL/IaosF3QNeWRa9scibdmx0gLoroxugJnPSIyZYTkjO+qv78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889239; c=relaxed/simple;
	bh=20UCt5A5N9hrL9kRW+9ruag7btP8aGZNt5TXFD623hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7Ze5bB+gnj6rT2vPUmNHtnn0shI13Jn6na1fwekkIEMdz0wiIw90ZblTo2ua9KllsBeG9I/yuTWvKGERrMplW8pRmiLPipHbVJ7wYsJBH+xc1CHd2E6PN1LFBhFB6DTcqecg4Y0t3pS0J/IGPir39+d376hswBRW558l5SnLWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of2YIvFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEn9ifFy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of2YIvFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEn9ifFy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9fkG13475851
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 11:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TGBKmg6i2DHwrZUp2sIicFVvMg7ugGymVJnpQzLwHyY=; b=of2YIvFno1pf8F2Y
	3nvEWP7kx9POMncPPbYB2ufRRV0DjGknhMGU5j8fyaQsQLJikbmFG8ErhCFkJK/h
	UcqLuQyuUA/pQ/P2W0lKk0aMLehNPyIlkj0hwRWkShDoxqO3Vu3XDZu75G8y/m/V
	Zd1iWw0AEfzRazADDzxV4k8Q3eQ4DSR1Zb2ehfRbq3lghikvVxwXCkMH5+oo/AZa
	lZlwqPboM5AUsCXzIoMD3WMME0NCaO5O6WbREeON38rsmnJMUB/iBiGFXelzPk0a
	fkgj4DP8a9WZ+aQp5AUtYABb6Iwg0Am6boWYVftM60U5pDxB3LfQ3Ov7x9NRxmVA
	4yMcEQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9nu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 11:00:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so5501440a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889236; x=1792494036; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGBKmg6i2DHwrZUp2sIicFVvMg7ugGymVJnpQzLwHyY=;
        b=DEn9ifFyusCTyg+wct5i80TZWplO6vNdROcjZqnw7kkpUOjvMKTF67wV+LQb2XE3th
         x9uKQI9f4D9Ru/f2111d58vLoHI202/m6OAvpVj9VwrtVjQJ7kcLJ1Zt9dm4zbmreDzB
         cBaOUD/Vh+6QAfVz4a+xJK/hXMcJMly3XIiB+8T5dIfYbxBdPZ02CbtG3qQEgkIaBjKz
         vESr3qaruJSukftn3leXsKv4e8qZr4HRca5OZ0xG55ouvufFWkDxrOEc/XUaSgTdWavN
         ZgHCK3BAGROOifv6aYKmFeQbx9xbcNWMeEcLge2RIoC/YS3y5/ltDPkGP9O3Vfc9nbTg
         RxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889236; x=1792494036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGBKmg6i2DHwrZUp2sIicFVvMg7ugGymVJnpQzLwHyY=;
        b=U1BA8XVq3JuZTxdw+darfEwRZMiSDvpCaiaLwVTMqEGx9EE7Hl191ZUDIMd2MZx6sF
         Ug8NuKTIMO+w3tD8p989hiDUyOjlFW/q2dpYBhpV5CcmU/YD2O5ROHCObvtcw4NU6toW
         fakLm+nn0Dp8rpcedvUbJnQz86b4vf89T7LyaFNK0jYxCx0OVrfstO0LePbji4f8eNoy
         q4F+z5Ua2ESaCWJ10wtSBFvoMpUOBwqUbzf1PSkOiz0YJlATyYsUkZjSgzqN7XLHoT/x
         1ekx7Nfz1TDJRiTy1lbXMAGIJFfCat5B5wKbWyKJN+9lfVnC/iBJrdce8lFoQiHH18/+
         cfBQ==
X-Gm-Message-State: AFq9FYJZgG3ATDvyYD18u2R27OkQGfws+AJImmRLXJrBa1MM8lHVtPnj
	PK2A3G3B+fh1TGlkdJhi37lxgJvyw1mVB/YbnvJazzx7Kp4GHrjfHLN15vzo4U+amiTYz0OxDKF
	pA+wF8Io0DtwzZXFR4mbGV3Wb3XMLu0pkfHA378g3wyjZ/MBGKG3Xx/oTvsAHA/j8NBw+ECBVBR
	3fK+A=
X-Gm-Gg: AYBFou33E8vbKeXYGC4ueZgB5FXnvdOWuKmgpvmdjqUekcPtTZbpVdB6krxQlx1U0+u
	teQ4Lvj/1Hfbd6pUGdJqhfYzl4g6XuCvxdhZ2axhMjTUQyWZhxfuOeRNqN4OUENIbCFo2ywX6rF
	gLMwvsOjtmuuiT7j5dpxjzgkVNn4LjBExBrK05n6CgADECLxLjjojekwBz0UAkRNoPoVklyPCST
	6UxSH13iZJDPO+A2blnb+kVYouI60ap/aqJ16sJEC0CvZQEaC5125iV5sqjeNEIYuA5RQJJP3qT
	sUkcMyjXiH8R6mUw1HfPqiFlNycKq/KNZ6T/xGnanYFgYVC8a+ZCYZVx915vSFaqoT1JDZffGFX
	qRA5lP6kcWPy0DvGWOHXA2m1Jmp6RGlOpEg==
X-Received: by 2002:a17:90b:5343:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ab3a956dd3mr10381524a91.10.1791889235880;
        Tue, 13 Oct 2026 04:00:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ab3a956dd3mr10380961a91.10.1791889223940;
        Tue, 13 Oct 2026 04:00:23 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39822051sm9247853a91.4.2026.10.13.04.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:00:22 -0700 (PDT)
Message-ID: <3cdcacec-2da4-4ee3-abfe-09427afe4154@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:30:19 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 11/17] wifi: ath12k: Add platform MSI support for
 CE
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-11-2c5797b5e4ac@oss.qualcomm.com>
 <sashiko-outbox-164035@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-164035@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T4p1JqjKoI8cgSdD5b_-Azn0QIhdTA5G
X-Proofpoint-ORIG-GUID: T4p1JqjKoI8cgSdD5b_-Azn0QIhdTA5G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX/28hTIJikDrc
 aIClCNp1wBweVqUPUI5jSGk+02FE82EX6AXA1/MtI8+1BGm708sH0IPhiocLyXTIW72k57AjIIC
 1A5b4sItia7ScCnMliWvKhgDkqARwMI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX3hMp76SgK0qO
 O5GRmQgpdh337uZIXx6zn5gwJQ3IBLj/A+UNjX2EXf5Pd+v/gnXGTla43Aibh6rR6o7BkPOuWBh
 HzLpYX2df9ocdGL0WGCGoqzz85Wh68tkLHZ+HWMcqVCoH6y7y72yKX1t8J4z3Jb3fWlczs3afEq
 1hBNqgn9vR4pGga1r0pdI0PW5m57qikUF3MoWhZtahEznA+uyJXi/894tVieIdZXhsWXiyTtjpw
 6Kpjy0WAw7WbpGE8shwjhCxz4xu3MO2e/z5EAk3b9fkaHCIM+fz9GVuC6ktxxvse046hP/0eLFO
 dKjXzQ8ZGcpszAgkkJ2KUeTqA367u8h5QHsw/zM3mUYkq4nt/K8t1+6CAwHQV9+2dSaH6UTvudE
 IBH/ifdOm+/eeCBzHE+RmPeL/YJvHTpgoT+hLeZ/Ilxq07y2MKTYeJC5aEf9qsK5S/O7nooyfoa
 61TCOKYaeFz5xVIscCg==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace0f54 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Tyqs917yuOYvDiiBU9gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130043



On 10/8/2026 4:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Resource leak of non-devm MSIs and IRQs on ath12k_ahb_probe() error paths
> --
> 
> commit ad41050e8b81bf8d1dd6e4fe6253604d235fd347
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> wifi: ath12k: Add platform MSI support for CE
> 
> This commit adds support for configuring Copy Engine (CE) interrupts
> through platform MSI on hybrid AHB devices like the QCN6432. It introduces
> an IPCI MSI configuration, allocates MSI vectors from the platform MSI
> domain, and registers CE interrupt handlers using the allocated vectors.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> --- a/drivers/net/wireless/ath/ath12k/pcic.c
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> [ ... ]
>> @@ -154,3 +155,157 @@ void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
> [ ... ]
>> +static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
>> +				     struct msi_desc **msi_desc, int num_msi)
>> +{
> [ ... ]
>> +		scnprintf(ce_pipe->irq_name, sizeof(ce_pipe->irq_name),
>> +			  "pcic%u_wlan_ce_%u", userpd_id, i);
>> +		ret = request_irq(desc->irq, ath12k_pcic_ce_interrupt_handler,
>> +				  IRQF_SHARED, ce_pipe->irq_name, ce_pipe);
> 
> [Severity: High]
> Does this leak the requested IRQ on the probe error path?
> 
> Since request_irq() is used here instead of devm_request_irq(), it requires
> explicit cleanup. This function is called by ath12k_ahb_config_irq() during
> ath12k_ahb_probe(). If a subsequent initialization step in probe fails
> (such as arch_init or core_init), the error path jumps to labels like
> err_deinit_arch or err_core_free.
> 
> However, the error path in ath12k_ahb_probe() does not appear to call
> ath12k_ahb_disable_irq() or ath12k_pcic_free_irq() to free these IRQs.
> If the device context (ab) is subsequently freed by ath12k_core_free()
> while the interrupt handlers remain registered, could this lead to a
> use-after-free panic if an interrupt fires?
> 

Thanks for pointing this out. I'll address this in the next version.

>> +		if (ret) {
>> +			ath12k_warn(ab, "failed to request irq %d: %d\n", irq_idx, ret);
>> +			ath12k_pci_free_ce_irq(ab, i);
>> +			return ret;
>> +		}
> [ ... ]
>> +int ath12k_pcic_config_irq(struct ath12k_base *ab)
>> +{
>> +	int user_base_data, base_vector, num_vectors;
>> +	struct platform_device *pdev = ab->pdev;
>> +	int ret;
>> +
>> +	ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_IPCI];
>> +
>> +	ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
>> +						      ab->msi.config->total_vectors,
>> +						      ath12k_msi_msg_handler);
> 
> [Severity: High]
> Similarly, does this platform MSI domain allocation get leaked on the
> ath12k_ahb_probe() error path?
> 
> platform_device_msi_init_and_alloc_irqs() is not devres managed, so the
> domain must be explicitly destroyed via platform_device_msi_free_irqs_all().
> Because ath12k_ahb_probe() does not call the corresponding free routine when
> it encounters an error after this point, are these MSI vectors leaked?
> 

Sure, I will address this in the next version.

>> +	if (ret)
>> +		return ret;
> 

