Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA094E433D
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776481; cv=none; b=Ly0pl6LNxkPcj8NP9b1OcNGRGY8b0lEHijO9nYF4+lc4WTMzciSKcHd+zqXgGDPoH6MW87FABlJ22CvBNYXGVtKNgucWW3wlkwxbcufQpJD9vrpazsofLrl8A4s/7cVs4DhliVP33cOMTGIlwURBT/+nEaIatiR/DLGfWyxcDsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776481; c=relaxed/simple;
	bh=p1dEZHWOCqIZMCAeAr+JzcO6l6qzrMOZX05XuccTfpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQBdaVIhHYn36kCucGVkqulf/ZzhUwr8cbvMYZ/vXGzGRJn8fi6FHFz/JOnN0eymU5mNmGUhyjaUcwhy5p2cq0HoFAb25+CNkUPFuZASo8nLXK3jby6Kc6lYFIAMRehupAKN4FdeXcVB6o+63GQoiTy5YaCutBVcpSORJD/Kkbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCMLeh7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBoYX87H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCMLeh7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBoYX87H"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDrArN690069
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 13:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ilMQ1MePaJJxNUKIWbLqWASxBz/Hn4eNufkx/CW0Bc=; b=PCMLeh7yiWmm+35G
	zdZGlJW9aILRtFQYJdRMNoVpq1QSUhrim8lmHIpKSqUm+h5SgN9ly4c3RBaQn4Ls
	CiNvFbTbPyR8DJuQFDUcJh8OTKg9pqzby/Ot34U+tFtSDLWfrSc5lKjj1VhATrzJ
	YWl+/gIPsp79JY41V31mjcZoi5kBSu/h/ZVAxvvMLxxp+J+2FkTexgqs6xJGhVnN
	UGrufjfVFNk8LrLWWWhU61uUm9P8Xnl5txXKeaORAvqFRbafSuhyLyTqV9YrziJy
	CI2fBIjLJlN3nS9NzFagoF+8iNjUyhrGVpPwHI7AnmNREJfcXiNG4ITV0w4K+G4o
	buZWxA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tg4hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 13:54:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8696b921ac0so4680376b3a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790776463; x=1791381263; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ilMQ1MePaJJxNUKIWbLqWASxBz/Hn4eNufkx/CW0Bc=;
        b=LBoYX87HV7vL2L0PGPs1cMTPKvYHbrCPp2EdeSdPoMOqHHPJuzBqTa8SEclCK5g0d8
         JuRkutXlJkIwprqKkCHM/w3ZZJQJrQlKoNKECQEM/dSbEZtifSOZQLqkPcrtVTEbRhZ7
         EkER7M4YB83Gmm7Absw6th0BvGYUEMqBfjzNdxqIDcVtmpEnTWIwY0JXNzPSKpBMvi8B
         iSWVgkQpHfM9YBYtOnjDJTcsyeF3EAnGFrZQoh1RCHg39RI/0IyjguDglf60cs9VU1+Z
         YpoQNXNM6nEhhC8wr26FoWkSKPoITTvcgcqFJKnUKnpW3+Ecxm5c6xgv9w9diuYzoH7+
         eX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776463; x=1791381263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ilMQ1MePaJJxNUKIWbLqWASxBz/Hn4eNufkx/CW0Bc=;
        b=qO2sEMihbye2sE9xIvNWa/7ggU1H6BM3s56CMMjQM3uQ+6hCpQ+h3Ii6zquQos5LJN
         doAl9ZnR2rJaUUqKMIi53fnHvPlxkMfU5Rc/Lg2KqCAWKSUaXWhy9W1hnCyk4HmU6x/H
         JRw+t+Vnwm7xZV+oobhIqIGMrC/XpDVn6IxJqYs05ysLU219yWf25colChKZncHiBUWN
         U7SBKaYStui37TBcnkAQtEPfgRkn9HanVlbXX30AwhTDPc4q5boNkch3ojkfa8ghtYLC
         jWZz8ZIK4EhGjaLNG2BfTDHfzTwERTUHOQF0DHpoZmQwcEpCIzVvbm0roqdswD18swa+
         hP7A==
X-Gm-Message-State: AFuF++n1OK42cZhnlfR1hyLGnNRqSqitiA71qeFrmwG/324bwbPXLr1w
	Msxu4kxeDckopIL1gA932NR5FqztnGv4l+UalohbxcfdRCxvMy5y1SFGAvhIU9RYk6QZ9l7EPKt
	Ti0OO7BKXo1iiiviosZ7x8CXRV1lUjHIg4svQuNjcoJiGdVIGIV6w2MyxxOND7ttYqzZsnPMlni
	seygs=
X-Gm-Gg: AYBFou0HeGVjanAacwcsY4CBPaAT/h+v2hTKeJqsCDuc+OKnHvuoyNKXcWEIUKPhSfP
	ChrkOdLZ4pb3D8LLrRm5X8SjMW0b+d2yy7s6L4PcfXFkskFHng1HaP91PfaJ5pPd/BYyL1KYM0b
	vafdOCUiAsvSYkIVyBvj6n4h9S5qE/pF15vY/dbgGz/wzsLBc8oVd9TSsWulvkn+khveOiL79JK
	vfysbbw8Myp1vp4H2aMpeYK5tLT7HULmsFKMGsxZg/zONmRPFlpx+sp4DC8Djwo3nWP80EKdIGV
	kbsv6sinfh3OTUeNtQBs+iqhoDVjnGMUNRWWxh89z0LXMUcRNBbZ+NqkULzbEKYFdyUHPoB2ikH
	kcLXOY91/Vl1fRcXb+La9GPxPosEZtipy4eCYzIga/DPOsP859XYvaSpjeR5ZQm0=
X-Received: by 2002:a05:6a00:4c14:b0:882:6836:25f0 with SMTP id d2e1a72fcca58-8874ba1e7e9mr1074369b3a.52.1790776462484;
        Wed, 30 Sep 2026 06:54:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c14:b0:882:6836:25f0 with SMTP id d2e1a72fcca58-8874ba1e7e9mr1074344b3a.52.1790776461977;
        Wed, 30 Sep 2026 06:54:21 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8872587f784sm871316b3a.23.2026.09.30.06.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:54:21 -0700 (PDT)
Message-ID: <66b8dd1f-7aca-467d-9929-8598bea9fb04@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:54:15 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/11] media: qcom: camss: csid: Add support for CSID
 Gen4
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, media-ci@linuxtv.org, robh@kernel.org,
        olteanv@gmail.com, conor+dt@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-6-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061724.7E52C1F00893@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061724.7E52C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NSBTYWx0ZWRfX8V+YFWqpn9i2
 Md8F8ZQ9KRXubV0kM1MJcxCM8RnFlFSKFMMeYr5vjf33XhmUZfvw51D3P/RtprlADnYwA/Qy+31
 2goGSXed1xm2oWDovqIJtIh+zFupCh4=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd148f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QeBPY30dwJJEyPjSs70A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 1Ow5G5_PoR4ZZzQDVxtUyvRl8Cqv5fYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NSBTYWx0ZWRfX13HFYCNKWM1v
 B6mLDn3+g5EFtASLodh62TPQGxx2WPmfoMHdJHGfKmQYokyuCPaEM/zxyEvMOBqkv+NXk7tWi9H
 eDaDxDdI6Qo7tCuYpFrSjpwPMP3Ztxeijk+GQE+TskUFl3CStwWr4OFRmys20lKK9AlNj6xE6cZ
 yESkU+oEraTQdfRy08wdH3VAQx+hy6DDnO2b8/jgSEwK48z5z8RvE5J0T2LRBUnegfaEwFHj7sk
 6bAAKI+ZrgHKUTD15jDTKVmpmMJ6YL0CRv882ZAoxSeiVsrP9L6YxXHiAdCT876qiaBZ4TUECEe
 E47ZBWY73P/hEKjDI82ZueUtvjLegCYonaGOVDN6c58lJtao2pu3oHCUziINRJNpdh7kPmQ3WR4
 Ygbowo16OJ9RWvJV47fYRpM/IIJykHlJXJsHHEZviR6RxyuafKQFk5WM/8a+eASn6Ugfj/cmEe1
 j/EvKuaTI4jqoyzO9rQ==
X-Proofpoint-GUID: 1Ow5G5_PoR4ZZzQDVxtUyvRl8Cqv5fYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300055

On 9/29/2026 2:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] media: qcom/camss: data race on csid->aup_update and rup_update
> - [Medium] media: qcom/camss: integer underflow in __csid_configure_rx
> --
> 
> commit 611abdeb4b5da574ae292d1ff736d0d71f2f4ed2
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: csid: Add support for CSID Gen4
>      
> Add support for the CSID Gen4 hardware found on Kaanapali SoC.
>      
> Introduce Gen4 resource descriptions and implement the hardware-specific
> register programming, reset sequence, and BUF_DONE interrupt handling.
>      
> Gen4 splits RUP and AUP updates into separate registers and uses a SET
> register to commit the updates. Update the CSID interface to support
> both this scheme and the legacy combined reg_update mechanism.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
>> new file mode 100644
>> index 0000000000000..4ff2f41f70f7e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> [ ... ]
>> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
>> +{
>> +	/* Hardware clears the registers upon consuming the settings */
>> +	csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +	csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +}
>> +
>> +static void __csid_aup_update(struct csid_device *csid, int port_id)
>> +{
>> +	csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
>> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
>> +
>> +	__csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_reg_update(struct csid_device *csid, int port_id)
>> +{
>> +	csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
>> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
>> +
>> +	__csid_aup_rup_trigger(csid);
>> +}
> 
> [Severity: High]
> Does this introduce a data race on csid->aup_update and csid->rup_update?
> 
> If a stream is configured in process context via csid_set_stream(),
> __csid_aup_update() and __csid_reg_update() modify the shared state with
> non-atomic bitwise operations (|=).
> 
> If an interrupt (such as RUP_DONE) fires concurrently for an already running
> stream, csid_isr() will execute and call __csid_aup_rup_clear(), which modifies
> the same variables using non-atomic bitwise clear operations (&= ~).
> 
> Because these bitwise operations lack locking, could the interrupt's
> modifications be lost, causing the hardware to receive an invalid AUP/RUP
> command mask? This might lead to broken streaming when dynamically configuring
> multiple virtual channels.
> 
Ack

>> +
>> +static void __csid_configure_rx(struct csid_device *csid,
>> +				struct csid_phy_config *phy)
>> +{
>> +	int val;
>> +
>> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> +	       << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> 
> [Severity: Medium]
> Can this code underflow if phy->lane_cnt is 0?
> 
> If the device tree incorrectly omits the data-lanes property, phy->lane_cnt can
> evaluate to 0.
> 
> While __csid_configure_rdi_stream() provides a fallback for this scenario:
> 
>      if (!lane_cnt)
>          lane_cnt = 4;
> 
> __csid_configure_rx() omits this check. If phy->lane_cnt is 0,
> (phy->lane_cnt - 1) underflows to -1. This would result in writing 0xFFFFFFFF
> to CSID_CSI2_RX_CFG0, clobbering all its fields.
> 
> Should there be a similar fallback or validation check here to prevent
> hardware misconfiguration?
> 

Ack

Best Regards,
Hangxiang
