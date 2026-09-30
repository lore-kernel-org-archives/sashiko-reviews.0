Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25415012A7
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777293; cv=none; b=mKzpMu1T0YX8oeen08hxgnGTP0kUvNj3xTXQGyRWI6a42NYEzDlx7H6pnDryNahKDx2Y3IrAQJGEzCbCHiH0IMf9dFH8Pqd0f0zJqBTiTADeM7/WeVzVbhTmQrnvgK8JiBkEmjO35CphTarFxhM8eZ9Z2gdcVPDQfJdcFW8qlvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777293; c=relaxed/simple;
	bh=3nLtYLFSF0/0HBjLgTBRgRJtaTOHmMO04FN0/7VEpII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1FBosQRExfc8sPEW9DQa/+P0zE54AC8mDbrbK1Plw9Pys0XvR847sY3vbQV/nOjxmUg2RecE32Fz8Ugc3/zSO/6Sn328eAI5AF8ux2IpKFLJ5fQAohh+gHkKAPu6pvj3V9cbBnKX8s+PA7tfBG1yA4i73MUJFVSddOo1uWE59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFZgrena; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPNk+Bte; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFZgrena";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPNk+Bte"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0Ivl147043
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5/lWtloNnIfNbXA6QSNEOy67CLHeyzL4Sp3AyQejEA=; b=AFZgrenaxIKYQYHP
	eIAPyxWdOBavkYQMZ3yZJunIvi/wwGAea1kGZQOUwdyutlJ1/iLazEtabuUIv0on
	25hSZhX4tCnskI1yUv/RqFrqbYDlVfMK95BiXxjdYdkhj1oPIjBM7+AuUmZ1yRm9
	JG4+3rgzUxW8KlQGlBRdfNAkVMGoJWSwfExmX9z6a3JDnmWVg61MBVfQghnC+pma
	jvCEWIOZu1GZFiOJiIRlLJ947UrTGZ5dCwUJHPS3p76Lmua8K3QrDbPoXkaHOmZW
	doezSkwPKo/Mjk0LGzVuMMyawvTR16Y2D4/AU5vSmBUVNYqAyw26VnMCz/3srj7e
	ZMygZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97vpxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:08:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso9392275a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777283; x=1791382083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5/lWtloNnIfNbXA6QSNEOy67CLHeyzL4Sp3AyQejEA=;
        b=QPNk+BtekKYJeoYmH/xd9vxciAc4KrkMUa0AUUHSj8bGyk6a21aROY/XGBTbG9uvfN
         sXxD7C6oioDwzFYa6dQvkLOSoTJQueEg0L5dJP0zOIA296yQmgCKpLTGBUOY4eFJbSd+
         57s4U/kUv8VtzJXSlQ/mCpVy820zMq0NPdQjahfkyMlQTfFEQoGqn7abVyvoQ5eM+n2V
         a99DN/3ntGq7a/kQOoVN5UPFFqRZoutN9D1e24/AsTL9Ru3Dgr7Ijp4Zpyn5o0pjzXbk
         g98y8RIgQQUjxs1Oh/gRtHyMRGaC3fwehSJYn4oo7AvdN9XsMHMVGCcHGRPGm10NcdgS
         7PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777283; x=1791382083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5/lWtloNnIfNbXA6QSNEOy67CLHeyzL4Sp3AyQejEA=;
        b=S9NEo3WEIQU0F0o/OfApx3LwF7CKTsJcfmouU7e6Fd+NwZ6iRcLNzxEzCCO4D/QT41
         mxw5IUXdQ3qNWaTFrqoYhriq8e2cCaI2cr76bofYR0UDz0lijRD/r47JHT/Pstc4BTMq
         TO8kqQD0829wxSbvUsW0L/e80WO7ngZfgznH41z8FqHcclVf9QPwH37Qz1rAq2W0UhA1
         Fo1908YElMQVvrk1MYvk8wjF1z26rscJYSfTMcVm2PH2ctxE5U0G6FDKC14gy7hOQZoa
         rOageaX+pnEC8dUN5u4kba9oAqA/uBG4N+lzjNQesZuVlN2uOCiqd9Jidqf7bLgiNOeG
         BRow==
X-Gm-Message-State: AFq9FYIQK5ikWSmXoCq0GWkrrV7jCmeJy3XWE/UrGpH0CYAwFXzbpc/2
	0efyD6RtHW/8wdoEOyyM+diOD0LJ/mg3ICRMMwlfLOJeOI08+sXEb5zUp/WwPYydzjgJek/tnxZ
	nEnRpfNZFhFCk/fQdMQG5cf5fULVutXJsTmW+5C+yIuCQWEl7Db1xm3fRDDGQpiqGJ9Umbj3/2E
	vRRok=
X-Gm-Gg: AYBFou0jt4rkp+sNIiFdEqJbVwG4GJdCPlFASnOV9jaiy6sjfcnFu3WyptvI3jkd1P7
	Ll0O+V35cT+fTmdmUhM4FyGMozPDo575IcGYbWeOQdiZi/cFpEF3IksofbUqozAH6TQ8EQhB7VN
	4y4SBPYQBn73QETGbMQR/7ACe+5pwTGKNyQcnVGeU/yPTRJqIPtor7X2ONXGOvV4DR7rHu/6ai3
	LWXVB5WkR2w8kiCBS333yvaqvd/dmjg9OXvTyQNMDo6CptyJq9J9OKg4HyBKvVkJ3xQdBa3IBXN
	/QsWzfrlw5TeIT2plUggHBlPIa0VTqM4qYbDS939ThLVrmlWmgtVlL1L1Hk5mQ9Bt0EIW8Kpowf
	H3YxMcCyIJxfMcA8Bj/pmtPKqplDakTgqjOnVlR4k6ripUFm8M0mJYs09ig0Mkw8=
X-Received: by 2002:a17:90a:2cc5:b0:3a4:e635:a8b9 with SMTP id 98e67ed59e1d1-3a4e636a641mr365458a91.32.1790777282555;
        Wed, 30 Sep 2026 07:08:02 -0700 (PDT)
X-Received: by 2002:a17:90a:2cc5:b0:3a4:e635:a8b9 with SMTP id 98e67ed59e1d1-3a4e636a641mr365426a91.32.1790777281916;
        Wed, 30 Sep 2026 07:08:01 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e5d9adeasm628557a91.0.2026.09.30.07.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:08:01 -0700 (PDT)
Message-ID: <a77004e6-c375-46fb-ba32-bc6f34bba2ab@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:07:53 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 07/11] media: qcom: camss: vfe: Add support for VFE
 Gen4
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org,
        olteanv@gmail.com, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org, robh@kernel.org, media-ci@linuxtv.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-7-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061755.8BA321F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061755.8BA321F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SBJJ4BUEveGRi16sQZiCE4UO0fozugSF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfXyGrfRJZm5U6w
 p3BU11AWlT3JIqoKnSHCM0GVuBYBVna2JrK/ar2xSRtldS8mSb5AN2/Mbf5iObFI06w9qX4lAKc
 4J5TZNoDB++PcXjo+C6GOWPhHFkcz1IJCCrWkkdWV8atz6/puk6bGPppZyOKB3rv18ZJ2vwixvD
 YRa+mTmQnogs1MUB1eRbkl4ugO4IXHgphDcCuo4bJBTDOYqMfwukOfJKkXZRImMgsU8s3lbJ13e
 RcZ3hTqKzW87dQ4Wog5h8OuETK6PZ5Sw0fLde09d0TToqUT/WgOe5OH2L4eMWArD24vn5GTjwrW
 Bl3oQoTBt2b8hvF0HTPwdvEYiRCxks2bSIe+3+y7b8xfEQUYGGUtMfPNhGXjDXQCWvSScKflwEa
 IOIl9IYmldDHqdTGC+d8DSSKtKb3OahMzpXeSnprX6OobQfGb9hX6fzIP++s0lfM+vaNgJKh/kH
 DJEuOfhybt9NMLRfoVw==
X-Proofpoint-ORIG-GUID: SBJJ4BUEveGRi16sQZiCE4UO0fozugSF
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abd17c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aJ_sJalLn2DonVaVJ1AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX19htJ7q6GPlo
 op38YoY4ybcjs7Sxgl3NVgXBMwYOK4sRzN5FbO5yzFMS0hUTjP4K49Z2qNXfiaPeI7ZEbaCf8IJ
 vrS0YV09j6KOfAKbPqV8ORvv/emB9z8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056

On 9/29/2026 2:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] camss: hardware constraint violation due to unconditional AUP_UPDATE loop in CSID
> - [High] camss: subsystem API violation where IFE Lite's 4th RDI line is incorrectly configured as PIX
> --
> 
> commit def99c6cf972d2305c4c27701233f42e411f7857
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: vfe: Add support for VFE Gen4
> 
> This commit adds support for the VFE Gen4 (TFE) found on the Kaanapali SoC.
> It configures the hardware blocks and clock requirements, while deferring
> REG_UPDATE and AUP_UPDATE until after CSID configuration completes.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> 
> [ ... ]
> 
>> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>   		output->gen2.active_num++;
>>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>   				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>> +
>> +		if (!vfe->res->reg_update_after_csid_config)
>> +			ops->reg_update(vfe, line->id);
>>   	}
>>   
>>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> 
> [Severity: High]
> The commit message states: "the number of AUP_UPDATE requests must match the
> number of buffers queued to the write master while it is being enabled."
> 
> In vfe_enable_output_v2(), the VFE loop shown above queues pending buffers
> dynamically up to CAMSS_INIT_BUF_COUNT, but breaks early if userspace queued
> fewer buffers. By setting reg_update_after_csid_config to true for Kaanapali,
> this defers the update to CSID.
> 
> However, the corresponding CSID code at csid_configure_stream() in
> camss-csid-gen4.c blindly issues AUP_UPDATEs matching the maximum buffer
> count:
> 
> for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
>      __csid_aup_update(csid, i);
> 
> If userspace queues fewer buffers before starting the stream, does this cause
> a mismatch between the generated AUP_UPDATEs and the actually queued buffers,
> violating the hardware constraint?
> 
No. The hardware accept this operation and no issue is found in tests.

>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
> 
> [ ... ]
> 
>> @@ -158,6 +158,157 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
> 
> [ ... ]
> 
>> +	/* VFE3 - IFE Lite */
>> +	{
>> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +			   "vfe_lite_ahb", "vfe_lite",
>> +			   "cpas_vfe_lite", "camnoc_rt_axi",
>> +			   "camnoc_nrt_axi", "qdss_debug_xo" },
>> +		.clock_rate = { { 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 266666667, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 200000000, 300000000, 400000000, 480000000 },
>> +				{ 0 },
>> +				{ 0 } },
>> +		.reg = { "vfe_lite0" },
>> +		.interrupt = { "vfe_lite0" },
>> +		.vfe = {
>> +			.line_num = 4,
>> +			.is_lite = true,
> 
> [Severity: High]
> The commit message explicitly states: "Support is currently limited to three
> output lines, matching the constraints of the CAMSS framework."
> 
> But line_num is initialized to 4 for the IFE Lite blocks.
> 
> Since the CAMSS framework hardcodes VFE_LINE_PIX to index 3, does configuring
> 4 lines cause the 4th line (RDI3 with id 3) to be incorrectly subjected to
> PIX-specific logic? For example, in vfe_try_format(), this would force a raw
> RDI dump stream to use PIX format tables and validation:
> 
> if (line->id == VFE_LINE_PIX) {
>      struct v4l2_rect *rect;
>      rect = __vfe_get_crop(line, sd_state, which);
>      fmt->width = rect->width;
>      fmt->height = rect->height;
> }
> 
> Is this initialization to 4 lines unintentional given the 3-line limit
> mentioned in the commit?
> 

It's acceptable to align with the commits. Actually this is a CAMSS 
framework restriction which needs additional efforts. Will keep it the 
same for TFE Full and TFE Lite in next revision.

Best Regards,
Hangxiang

