Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1893019D8
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 04:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787633090; cv=none; b=puE48rjNBY9vgadixSBNZUG83ADSX4ThP6HbgmetgdEoHUm9QktGUt1X5dNsMi7J5dtiI80AD4EO8MgTVUj4azyinK+7eW+NwhXDY7gDGaILAA6oBvPlUiE/gSHeV044crB9JffNNbcQjD2Ykl7StqI6K8snK9gnRR9/vYK3TZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787633090; c=relaxed/simple;
	bh=z1SRqJwln6EdwYhvqV0Vix0eEd5rj7SXGKLr0mBnAGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsa8oS0xX3mb7O01nesSJAYt8RmRpVzQK+vG0tWgSOLVB4Wskkfuuvn1ArKGxomIS7DAIw2d5Qc4WyjlG3OOwUOl25kdDgnzfx00Y43gAGNQB7KVqvxG6ch4Y6R2QHpSK4vk+cN5NT3GLS7ycnlRI2RQ1VXh1Z2rrsZy2y1IuDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kq7PA9dT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbgmctW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq7PA9dT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbgmctW4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RAoZ120629
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 04:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3FPUWhtIRBJh0juj9zIQAMLmr/XjapFy1xsKtm8WH4=; b=Kq7PA9dTGpKKNYWX
	swFXdZldQelaKNtuWqRUiOewGPDKlS3qki+JevGI/RHKtFsXqTieAajbsXDo+jMF
	RAGV+DspBPJSfSns0mbC2EezUgRO9UK4uulLLcJAyyPKipbWvOxJFZsBnVvph06h
	Vmw+1sd9PLdbjvzr2F7TkYFR/Iuz8VqmSBgJ5UFTh5Qf93VU7HxuHkVUr0MZ4AqU
	kMvuGMuGLlkw9CZX4461HMncvnbYTdZHbChTnWelaB49PaJ4sZrfB67Zgvynlxxh
	NWVG7BR+O/P/eGVZT80wSz0V/kApG0IQ74COdXDscGk2K4mO18xHJALhwaoU9ZKd
	2kVC6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3dt4gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 04:44:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso6435796a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787633085; x=1788237885; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3FPUWhtIRBJh0juj9zIQAMLmr/XjapFy1xsKtm8WH4=;
        b=GbgmctW4B+j6R5Q1YosNkswTvehHdSQn7v0oRNT3kaC5P9BBrOMdzzpIh+frc0PQQ7
         PvbLZ4R6u8J/h9ilm6M8UBmOeMrDlIEy0IN/jlfLgWEY20H/0qmSUx1bqAmI7/7waAzy
         ZnZs1vXLrsAiZ0QYmM8ngpRI3Dken1WBMmIuiKcY7fKRy/TaaiItFFO3FF607d9+/XTo
         1IpaNsLCSPNWmVB1DeZHwuu9YolHHhIM84ofssnCbb1kUzJhNcNkS+oZXjov8a6Okc7B
         azr3fpaGpvD24NvFL4+JEg5cZAyh9i9WmCBfZR8P/n0FQM+OLIItqWE2/kN3MfbSJn9E
         558w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787633085; x=1788237885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3FPUWhtIRBJh0juj9zIQAMLmr/XjapFy1xsKtm8WH4=;
        b=ItmlzzlAOiAYRm26acTAGPLNQSzE6m1bRg+JSPEXTuQx7SDQQW4ji83+sr481DGue4
         /opMkRz7OWBVE6PBVioDD76hAzdO/5ds71FNkuKKqWktZDn07tERhBka302kzgUMgV3t
         xzB7F4iJUYBRwgvfYtVy8c8G6ciLjJC+VaXgFXWYj6GrXbenyIy4qxVQVYTbch46T0hz
         EutvRnEWiTHXAcMg0EtllDhdwBvYqEcvibapVkCgbm5mprxYVKwXIAnXYNNCG6aphMb5
         MBjD87mWONuGCQRN1xNQy6Adw54kU6S4/2VmM0tfU1Ub0M6AYkQppB0+gT/4Eh8I3viI
         MXAA==
X-Gm-Message-State: AFuF++k4Yl8VOtOo4u4pPz83HKw8yBvtgNb4RS6ak+xPhMyPmftKJac6
	eQvHKvbFusRSRwWhe5ms5WP5SgcPDlJyfjvkDjxRo7QO9jJBSv7GJfYr1QkI00StD0g/rJFSzwV
	vBj3PSKmgngGtak351XCmm3VnuVbwekvwjuwHM1mdSkp62nB7LlkCXBrYG6yflWJemY/3vIHPxo
	FOfz8=
X-Gm-Gg: AR+sD139DSzE/M/69agx6qIdDLZWad1kLLeU6pJfyLKNNR55uiSFH2mZkXq/BL3yAT4
	MdZQccNVce77lUxhav4hhlJXB/3eR3YmT3Hh0TnJeJSx7JUJv7m3s6y4Ty5X9xvzARjP7yD40Vi
	nAmwxqoSIZC9mjtB0rMYicZOzMsXAaxVQThVCF2gTzKb+2Syg+Wd0Ap4RPoT7zhNoiF5WLXC+ue
	fUDtVm8lpQNfw7OtSW/B/VQ175Znx2OCueRlNYn840J/nST6jpSq/zd8xo13iSwa/71YdBfbeih
	yCEjObZGKqj0DwF9UTa7sy3Sf06AEMLsjyTEwayTknLJgSKFMy5ZGnKXrpWfWOxrOGp9aGJ15ZE
	1o9C4rGqddkHx5jZj+E178nogEW9j3kd4h8TUC2SWBSiqVBgk4vHknm3sNE15KLJuVMar
X-Received: by 2002:a17:90a:100f:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39640e6f6d9mr7351106a91.3.1787633085430;
        Mon, 24 Aug 2026 21:44:45 -0700 (PDT)
X-Received: by 2002:a17:90a:100f:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39640e6f6d9mr7351059a91.3.1787633084946;
        Mon, 24 Aug 2026 21:44:44 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm2137851a91.10.2026.08.24.21.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 21:44:44 -0700 (PDT)
Message-ID: <7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:44:42 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
 <20260717045523.A762B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260717045523.A762B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g5abOgywCzpbB0-kX6_C1Yjq0dTcrBFU
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d1dbe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fTKdFPA47RI9VHlxeigA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: g5abOgywCzpbB0-kX6_C1Yjq0dTcrBFU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAzNyBTYWx0ZWRfXyqHtp+8PS+9z
 X5JGmXHFQVc0AsEdFmci2Z4o+5zhD0oiFLbGo9FnK8+8ABh5j4BILfi/CLPC4rcekvF28SlwjGR
 zYq7oL8M70KSaCT6POOt/EHrVgQhB4M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAzNyBTYWx0ZWRfXx/rT8c4DGHAV
 PXa6CLSX6wYCWgaYLxTuTzBKB8RSivPudPW1Erk+lSLZRf8APKvCnODJdjfSToNKlcRnEsVFqtp
 cGQod+62KTl5ZWG1A3tJYThNAOgluyLvaJv2bX10gP6drNmZQ0ZiAYIzdDIEXWH81gxVFMM48gJ
 Di3uM+DuCQ9E5qhnfAVJySvXMYSjg0bmNDqHBVH7eL+Gu7A+kase40CatTLDXZToW/0TL76xjeI
 MrvpXKTLdbtLP9geXNNLmTDlFlZtElZ7a1rpYWGTHsrgCm41JuU9hHdl742NSI26vjBxFQjorwL
 YM40+9BevYXePVxslsRXghMNcXlM2ehX8jqyuiAHDnuiEarX9bSnoWdhWls2mH+GwxcR3OctC34
 c6pw5yHIo8oLzh2kHZVf0sY3DgZxde4+Ve5/E63FAAN42Ddz44gBIOd9IJZd3Rl82eH7PERWkBz
 eGI1F/y3UTYYxrKQ52w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250037



On 7/17/2026 12:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The driver permanently leaks a hardware LUT slot and fails to trigger patterns when a 2-step palindrome pattern evaluates to an `actual_len` of 1.
> --
> 
> --- Patch [1]: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode ---
> commit c5b003f7bc9326bf3784a70ad883c39b215ae496
> Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> Subject: leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
> 
> This commit splits out pattern preparation into lpg_prepare_pattern() and
> adds support for per-channel scaling so the hardware pattern respects
> multi-color LED balances. It also updates the LUT storage paths to handle
> the dynamically allocated scaled patterns.
> 
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index d7d6518de30f2..24b1f570f5244 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> 
> [ ... ]
> 
>> @@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
>>  	 * duration of all steps.
>>  	 */
>>  	if (lpg->lut_base || lpg->lut_sdam) {
>> -		lo_pause = pattern[0].delta_t;
>> -		hi_pause = pattern[actual_len - 1].delta_t;
>> +		prep->lo_pause = pattern[0].delta_t;
>> +		prep->hi_pause = pattern[actual_len - 1].delta_t;
>>  	} else {
>>  		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
>> -			goto out_free_pattern;
>> +			return -EINVAL;
>> +		prep->lo_pause = 0;
>> +		prep->hi_pause = 0;
>>  	}
>>  
>> +	prep->data = no_free_ptr(pattern);
>> +	prep->len = actual_len;
> 
> [Severity: High]
> This is a pre-existing issue, but does this logic permanently leak a
> hardware LUT slot if a 2-step palindrome pattern is provided?
> 
> If a user-space process provides a 2-step pattern where both steps have the
> same brightness, the ping_pong logic earlier in lpg_prepare_pattern() will
> calculate actual_len = (2 + 1) / 2, which evaluates to 1.
> 
> When this length-1 pattern is subsequently stored, it allocates 1 slot where
> lo_idx and hi_idx are equal. Because they are equal, lpg_brightness_set()
> treats the configuration as a static brightness instead of playing the
> pattern.
> 
> Later, when the pattern is cleared and lpg_lut_free() is called with this
> lo_idx and hi_idx, it hits this early return:
> 
> static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
> {
> 	int len;
> 
> 	len = hi_idx - lo_idx + 1;
> 	if (len == 1)
> 		return;
> 
> 	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
> }
> 
> Does this early return bypass bitmap_clear() and permanently leak the LUT
> slot for the remainder of the device lifecycle?
> 

I think this should go into a separate patch, since it isn’t introduced
by this change. On the fix itself, rather than checking "(len == 1)" to
clear the bitmap, we should add a new flag to track whether the bitmap
has been allocated and only free it when that flag is true.

@Jones, what do you think? Would you prefer that I include this fix in
the current change, or should I push a separate fix after this one?

Thanks
Fenglin

