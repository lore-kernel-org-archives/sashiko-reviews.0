Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104453;
	b=lpATADNtruvNYq5mHAM1GGoECJMUbRlGzvVicN34WskjaH1EfXaeCtPAL/SdcQcvCQSh
	 PI7FBXkUPlL4fgqdHkILN49ZVn0ci01FZC6VfKKHkUnYhMjKba1FhZhPiycEV1rXgohcw
	 mqSoims+VZwo6jj9f/jnnpMYoTccqywyYkydPZz9j+0tlDepZz8FcXkJPkZYZVpR2jB/r
	 Q2H4x2OhmCuvGcAgVqAXY5n9Q/9ljj2nDjcmtB8jxVVYfDNpLFzlj41/lQRzUMUh9RswF
	 ms6GI7mm8TnFKHHTOMKGymG6jm3DDVl6ro9NDL19z5w7f1jujTIX6a+nmlBkOOzpP6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B9Knkh+WsIvjFMm93DD5cwjOlqjNFhWqu97xcck5k7s=;
	b=BhVuYn9h3RDyLVuyeY6ki8iQMEhR1wMO2bMW7kjf+MDhc5n2ZYZsZWYdgYVguAbsqN/Y
	 oM7xUHGVBZZ0jJBPjTd8HpHBJv6/l4K/ztFCR4PL7iidPN0VGLIDWuG5flvmgOCvw5Wd6
	 0AvswzwHgHOtZUuTOXbnUHllIS6MUIfl2Im67HoWQCf3wiccJOk3tUoXmSPN8Dfum9asN
	 5qxYbf5mRcHl4MmVBvF8eYgq320tMLHy94J1GHc5wt+mBR1YODEgchaLerBRc59X0SEQC
	 u+j7D4eBa1WIUs7Y6LgJhj+D1VEif3uxj+e3CH0HFns77nNN4MUDlDj9lLxB7l3vvtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCmS5Whc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QPUhAbhg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F7606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 12:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCmS5Whc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QPUhAbhg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3BP2458381
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 12:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9Knkh+WsIvjFMm93DD5cwjOlqjNFhWqu97xcck5k7s=; b=SCmS5Whck2wp3mEA
	ARJ09ql/yzgKuWFcxCnMbu6TdRxhgm81MTG/5HAmg7yhmZdajmEYUadkQHFG2kEN
	bOtydwpDBo4wFeO4lW2fu9ufRyBE6eSHuPv3pQmoEqPxwkdP1dBDROYoCjznZ+eN
	jg9L/G0wxdm0UJh/0cu4VPBzUBya7JfhWJUVoThhEWKj8GctDB7U8EEkjgMMhBU6
	VA2PDNN0/oVWTlrNJF5390Kz7l6iZ/ve5UFudezudItO56O1RqgpkhxcVQweA8KP
	s3TSThDB1fViMQt+eykLbXQYGRMPEbUDerCxiDCCJ5UbIFFbpfMjZLOk9MbhQXzM
	opOJUQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta8r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 12:34:10 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677c4ca22c5so825252d50.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104450; x=1793709250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9Knkh+WsIvjFMm93DD5cwjOlqjNFhWqu97xcck5k7s=;
        b=QPUhAbhgVo/shAQjEySkggcePyqbfDpkT0yWTKNHhrI48425wylc0UN4VsCMKkS9c+
         x4e2A2E5TFacFQWVCM9xf4N9zRQsIfwKFoj7RLeSC+zKxknbW35K3FDalFksZst/lzNM
         S4LBgn8kTMseOnlzpIlDVmVtfbqYMiip9Q71td/FZmgJtKB8yMjpoqH2KRIU1FkaVk4a
         1tTjCuN1Wf2PEZDx2vLEj4RI2Hfe696jItcacEU4p1AAgcJoG9XCmQ4ByhtqX/ztaPR1
         pY+URZ0S3LrD8u6hlAzIuRgwLMMe+1SK7WQlGXweNiaiFj+JISCL0yoIwaYEIi3+KnXB
         7zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104450; x=1793709250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9Knkh+WsIvjFMm93DD5cwjOlqjNFhWqu97xcck5k7s=;
        b=n8Sw/Ljw1BenmqAYB1W0xS0gphC8vhTlCzW0hcoYjAHgMbw6XiB5I+83CjKFpKS/99
         oBNK4DILRMj+qeQn3amkmBZ9jAkg1ZvI1/+i4/GiNUZMeJeT17hci6hqjCyz+MoSNuwR
         yo5wR3LrBEj6BSI+16RvIjr0Wj4cUirLNnmvIJqHplp7YevydGvUXb4/3FXxsCIvcNIm
         YZcdtNfWsDlyt0EyPBPC1PyOzNye5Jtctt8C60DzhKdmhu1MLdHwklswqOR956LUxY1E
         d/xePBqh8nDbLnmXPlSJbFM/Bk3laqlwz2vF/WD2G+yk7N6SzSDPwdfI4nySrb17T57E
         E2mA==
X-Gm-Message-State: AFq9FYI20ZJzJrZQYhpvxR4VQbxkET5SrAOg8XoFs3sNgJFGg0LWF1AY
	Ir1BDhm1Xw4U3UE/8aUeK8nDZlwNAqFQq1RyluMGIRL7s9u0S96QHZkU4F24UkU3fcqXBKVZ3fX
	HANwN5dCLUarzoK4e3pP+7LBd7Y0hhE1tCmkuo7fsdmF4NVKsERCxrzaniSu7IYdOhn/qK4Vec+
	yIwJ0=
X-Gm-Gg: AYBFou34v8VmDNad9hLujRasW/wog5myhXo3yS7fqZohnfd3apYLsBElkbLO+3bC6OW
	B0xYspGd5sjVuKmalsB8X88oFqKETIDbD6jicRPFnuxmtqlHX9fCpehqMR9aNHd4m6EeKNcvwr/
	D/KsiZBEEIoV+sFxy00Du0YYCy6QSNpplhKDfqDzxi0mRqrTrYyFB5Xl9/DvGh/hOwT4yz4YLSO
	DyqCgHZJobFkc8XWatcr8a9KkrEstiB2H9OTmBsFQNrpi47JfK5IWidf19ztvFLD57wDRQl032z
	z3Xc8Vsum5+fIcl5tSRcObdMLMaWiVe/wl2avorEXCu8WuslNTJiwDatxh2AHGzZDQwGTP033jD
	NJl+c6HYFwsTi5dg1IGikPH5qC2Iu
X-Received: by 2002:a53:ac98:0:b0:679:ad95:8ef8 with SMTP id 956f58d0204a3-67a454404edmr7327242d50.62.1793104450372;
        Tue, 27 Oct 2026 05:34:10 -0700 (PDT)
X-Received: by 2002:a53:ac98:0:b0:679:ad95:8ef8 with SMTP id 956f58d0204a3-67a454404edmr7327226d50.62.1793104449862;
        Tue, 27 Oct 2026 05:34:09 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4622e78esm4690840d50.12.2026.10.27.05.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:34:09 -0700 (PDT)
Message-ID: <5b771fac-68fa-455a-8970-dd42b4e41e8c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:04 +0530
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
Subject: Re: [PATCH v4 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-4-258ba9612da8@oss.qualcomm.com>
 <20261001130511.C511F1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20261001130511.C511F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfXy2rxRQAOb/na
 /0Bo2B1Il9Pgmbatb3JRCcKaRzw0mmcm/YYTjIUio/sFF+ZiARC4RkzZOaanF/V8ny+jciEx4A5
 6il3SnaVZVfL35idFYkQkXKMiVjeNYs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX/AYo1bwfEpJ4
 UZKvjxCZwL1mU8fEQKvuwilNZHZLFlUDR9y/Lq1bhd59YVNBoDmXhI6t9eVVpyED+ulHQzo48Ze
 +Y59CJ9MDx6+IbSs352kD1TFXHQPT2bY817Bo5B5kWFcWcTeE+9Yx/SazNTJv/nxfhiQpqKyx82
 mmRrjwsCoS3EchmEZLlB20y9mjIlRybsuWA5TNzXh3iUZT1EmmSuooc/8fPGtUcm6cJajijkgvp
 gyM2rgSqGyuQi/7PDUuaHWpHNukt7n4M9AWxxx6EU/1cKxO/I3//i0hCAphBGm24v9CXfn1rx1J
 zc3ZbqtxYD7eWcE+vgAcH11Oh8uHryM6t9Ej0k5FDfBD4MlQQxfYFuDCOVdd7FXKmqshfSZQjFl
 7yxppgs2XTLlKWVbHL1Fp+EXA+QzEesJVXNxFhnA4crZA5xc/Bsa88lwO0Cy/7pZoyQogvksb3b
 VqcGhTl0em9qJz0aVQA==
X-Proofpoint-ORIG-GUID: zN-4BcxFzvPXwGtGWpbeqgjs9jX_-oeD
X-Proofpoint-GUID: zN-4BcxFzvPXwGtGWpbeqgjs9jX_-oeD
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae09a42 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1V9zyztEnOGGBHuOcGgA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270049

On 10/1/2026 6:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] regulator: qcom-rpmh: Use-After-Free due to devres LIFO ordering
> - [High] regulator: qcom-rpmh: Data race in worker thread bypassing regulator_lock
> - [High] regulator: qcom-rpmh: NULL pointer dereference if delayed disable fires before init completes
> - [Medium] regulator: qcom-rpmh: State desynchronization on driver removal drops pending disable
> --
> 
> commit b0211424f1ad79c3af4f67d5c03d4546a1bd442e
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> regulator: qcom-rpmh: Add debounce delay before disabling regulator
> 
> This commit adds a debounce delay to the Qualcomm RPMh regulator driver to
> prevent rapid disable/enable cycles. It introduces a delayed work item that
> defers sending disable requests to the hardware. A devres action is also
> added to cancel the delayed work upon driver removal.
> 
>> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
>> --- a/drivers/regulator/qcom-rpmh-regulator.c
>> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> 
> [ ... ]
> 
>> @@ -347 +347,54 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
>>  	return ret;
>>  }
>>  
>> +static void rpmh_delayed_off_work(struct work_struct *work)
>> +{
>> +	struct rpmh_vreg *vreg = container_of(work,
>> +					struct rpmh_vreg, delayed_off_work.work);
>> +
>> +	if (!_rpmh_regulator_set_enable_state(vreg, vreg->rdev, false))
> 
> [Severity: High]
> Does this worker thread modify the hardware state without holding the
> regulator core lock?
> 
> The core consumer APIs execute under the regulator_lock. Running
> _rpmh_regulator_set_enable_state() here asynchronously might cause a data
> race on shared structures like vreg->enabled and vreg->voltage_selector if a
> consumer calls regulator_set_voltage() concurrently.

I checked the driver again and noticed that the check for
(vreg->enabled == -EINVAL && vreg->voltage_selector != -ENOTRECOVERABLE)
in rpmh_regulator_set_enable_state() is only needed to cover the
case where there was a voltage vote before the first enable vote
coming after the regulator's probe. After this first enable vote,
the value of vreg->enabled would always be 0 or 1 and this check
would never pass, so it can be ignored for concurrency concerns
with rpmh_regulator_vrm_set_voltage_sel() which checks
vreg->enabled.

The other comments are valid and I will address them in v5.

Thanks,
Jishnu

> 
>> +		vreg->last_off = ktime_get_boottime();
>> +}
> 
