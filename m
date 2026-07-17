Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC5A26A08F
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784257728; cv=none; b=SWj9+fmdxznW1dQE0R//VNKlFHOhXLzHe+vAwbjOkFouyXGaZl5H5mI3D/4Z9JyFJ7ZTPUn6bQmrNEuzxJ6mpjqH9yC5t6TEE1exrDQ2PFgtUrT8In2L6LpSr4N3SXXiyrE8cNXkkmkgZ/qzUTZqHVS1pQjhwWDHPZOVaG1HazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784257728; c=relaxed/simple;
	bh=2kODCU52lT/W/+CJKzLgYG2Fzk4wfuhTAYEzLBCYtHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnexvXhvZ7Guny2XVWaZBOBHApeYobrdJ9VKAb0XbFAg016tAdmnXLlyGPM03mzysDx+fS7stxieuGmZV2t0ESFrLOhNANP72LIeSzUVQdSWQFTsyeZMyK1+TkYdR8qUZiJo0z9rYzUqyxcuYcs4hH5Vn8PzjoJlYwYB6Mkk+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxPv+dDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2dBy5Ya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxPv+dDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2dBy5Ya"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33tkb338240
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXyVGivf3UWZOqVUOzlxgpcD7lIywizl54v1ZomEtRs=; b=AxPv+dDNNMbwYNrZ
	6DV69VbHQ8VNc4FrHjJPQG76qpoXI8ZbmDULTkGqYxDHPt+H0IFnBosOnk8x8MWX
	pBxyF+x5vn3Z7NQLQx/KTDTC0zm74gMZpjXUKXAKxkFmaprURWc9e7YSjeKZcb58
	8jc0emcdvk43QPtxo0PMTpncPawVtK5W39tLRA+QCsImFy+ZBMK9kLOm030e1opE
	sKMJl1mCKNKaucEGJPxx5KkxhiFcKWl7tEYbUkn4rRjrEm3Pzka/DFc0umerVUXl
	NkDQTRmVsjZSQL2UW/G2wzUQAUGckASuzvu3gnDjphoVHVOnpTVJImo2mJSdCA9E
	+S3tAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1weab2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:08:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso4048684a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 20:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784257725; x=1784862525; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXyVGivf3UWZOqVUOzlxgpcD7lIywizl54v1ZomEtRs=;
        b=Q2dBy5Yak4Ax5a8ZXjx35S0eyrt7oxzblyC93coRQ1FBMIMsICBBb6pC5Y5FTgg0Vc
         D9HAb+vIfyQTIegx2je4if1HSNPW0VsTfyZpnNOtS5HjqwGsqS75vL6FimwsJzZHpP2k
         2m7Z3X8f2wl3lictULe4rfthYCPGTKhZ5kvlDdbxF6g+VTy/Z9nvx17iQYdYs8I2T721
         U16AXIVSk3lvBg5txza+pxeinPuvZA0BtNKcvs6qHsC5FJtMvPMqQ3YOdWkrRYYDQDMr
         2bNyx+ukg6u9h+cFFiuk7ur01oHFtOwjlHgTSnN1GL44v9D7VDLTddf9/gd/EZVSwLZH
         W1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784257725; x=1784862525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXyVGivf3UWZOqVUOzlxgpcD7lIywizl54v1ZomEtRs=;
        b=rBbHTtG1N7WNwBUkWBeqL3Ziosz9uWljE824KoOZgP2xXJOxFCS/OjbXRk6gLf4l7C
         oGISoh4ai9PDSfEMQ7LOe88YiO/SV0MBaGL21W6/pMlxMMzLT/MifsmWQFbAzF+xvPHx
         z1dw/ml6lKyXRu+S9og02WzEgr8wbc7jvVEBkJJi+9lzTMiqkNMFWLP2v9pia4J3/PcV
         0ClykaD1ElQPICeGdwjSx9RzDEA1rv3F0YbMoUlDs+DI2Pg9ItuLVpNW7F/j3ujekgxD
         UEEbi0mToILuWWpF+zggI2fAEEfqSmjWrnWhd/xu2LiRico/E2Hq1x7A8g5YdqHU6Dsq
         f2tA==
X-Gm-Message-State: AOJu0Yx/T0UWMUcYMg3GL/C9JLIsaveOiTTPePYe/skJghP/S1DR86DU
	8GFtyDRcYRRspshk96KzvMa/MXu32FOWFkt7KNpvdLRES9a0Hrysfcp+1JygN8VyCj8el/EVX6V
	38BdyAXAOQhuk/s/m1KwwuTKSrWSRxSMYk1qaNbeWX9y9P3Iotdf6TMp9ikmHlW+3bFPwX1W268
	w5T8U=
X-Gm-Gg: AfdE7cnpPNcrBHon1v6GeDHGwdwDWJoyXDKuySwnsCLG7KfG54nPM1VpeZHa3mbs0SY
	shKyfdTF4LneyY3xcOP2CIFklYoy2VhxeMubC99VNo2Ok1phaWT7h9QxyvL+ChhdABcHvBa3kkm
	3JRJjKW+FDEj0JL0OzFfp+YnG/Tkd170SnBCXP4iObhIC8+Iw70Jy1p+CGHrKUw6vu7zs/ArmKu
	pFTW8WpLfLgL1BSCigpvyO0UwKYA9gGazGXRTjvjtEousnz3Eg6qCV85z+iVkmQjSfA/6N4nkdl
	5C2aKHk9FeT/ATS5vwfHI9Q4Ti/p6gtrCHkQMo66BIetStxZk93LPcL7IhPaFvB9HRZQpiBGn4H
	UEvlYAWhwWt7FDVOnz6IyFQTKDZnBZIiNDhXpachXipM5I8vjSMnb8XjjSSLYHiE6cmSViIUg
X-Received: by 2002:a17:90b:2785:b0:380:15fa:c5b2 with SMTP id 98e67ed59e1d1-38e4b42dafemr723813a91.18.1784257725155;
        Thu, 16 Jul 2026 20:08:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:380:15fa:c5b2 with SMTP id 98e67ed59e1d1-38e4b42dafemr723786a91.18.1784257724618;
        Thu, 16 Jul 2026 20:08:44 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e48085853sm144811a91.2.2026.07.16.20.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:08:44 -0700 (PDT)
Message-ID: <d3c1909e-6ae6-459d-8bf5-8e8c5aff4ce7@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:08:41 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/15] drm/msm/dp: make bridge helpers use dp_display
 to allow re-use
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260609-dp_mstclean-v7-13-ea04113e8233@oss.qualcomm.com>
 <20260609100904.452091F00893@smtp.kernel.org>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260609100904.452091F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyOCBTYWx0ZWRfXxbZErQPuV+1L
 3sHLcABp4gOWH8IAJ9sM29DiGfLWvm1EdWR9go5Qf7HRE6R/PtFvuy46jYOTKtnJrxYzB6SIo/4
 173xN7B77sbpsO30chwtVNBq8Bx4SFSmUq/vNT7Ee+lNFes4lzeOl6lNQOYuOWXNnmus5NFbiIK
 tBst9zN5MGS5hqgkds9lv9hBVdrjjE3H0KQOtq9eQDHi5KCNge/s5falIOSY0uwQZhYraEd+wul
 FhS21nRMnI8lE26SMZQSe5cB/C6c8OFCqx7Uke1c6UmVGEyO59KxwoBo8Sbd2NXWEg2bbOAIHwr
 v3JqqClPVjvBp5fM07rv/xoKblCwnTCWfhsOVnBiPr+sSYMB5303CA61npzYrL2Bt3hjqkZknvJ
 t+A6xN08ishzYe67mF79+Tu1wo8WE0WcwjczqtLK+4agDaiR8q902gIv9jYHFz4Q08Cq/4NapkO
 8iV1v04x+ef8gnePozw==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a599cbd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=z6SnXkDR-izpW1DdgxoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyOCBTYWx0ZWRfX7cJlGt/p5lqH
 0zoRsqK3N6IlVPOmiiyVh86L0ubnliS3cPw59w3QNRYyayzu6rH9dtadQafeO5FSj5dGONZgBJH
 E/UiDIWoO5N2iHyXCfPlkbJ5QljXSQs=
X-Proofpoint-ORIG-GUID: dtIAFJvGTajvPTLGH-U0FgpFoD8uJ5me
X-Proofpoint-GUID: dtIAFJvGTajvPTLGH-U0FgpFoD8uJ5me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170028



On 6/9/2026 6:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Hardcoded base encoder in `msm_dp_display_atomic_enable` breaks MST reuse
> - [Low] Kernel-doc mismatch for `msm_dp_display_mode_valid`
> 
> Pre-existing issues:
> - [High] `msm_dp_display_mode_valid` ignores the `info` parameter, validating against the wrong sink in MST
> --
> 
> commit 79702b8fc2a6d1a516b0d64051edab10a8d7764e
> Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Subject: drm/msm/dp: make bridge helpers use dp_display to allow re-use
> 
> This commit modifies the DP bridge helpers to directly take the dp_display
> object rather than a drm_bridge pointer. This refactoring is intended to
> allow the MST bridge to reuse the same helpers.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index f1970e6dd7e46..cdb7dd4cd7cbd 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -738,24 +738,21 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>>   
>>   /**
>>    * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
>> - * @bridge: Pointer to drm bridge structure
>> + * @dp: Pointer to dp display structure
>>    * @info: display info
>>    * @mode: Pointer to drm mode structure
>>    * Returns: Validity status for specified mode
>>    */
> 
> [Severity: Low]
> This isn't a bug, but there is a mismatch in the documentation. The
> kernel-doc still refers to the old function name msm_dp_bridge_mode_valid,
> while the function was renamed to msm_dp_display_mode_valid.
> 
Will update it.
>> -enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
>> -					  const struct drm_display_info *info,
>> -					  const struct drm_display_mode *mode)
>> +enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>> +					       const struct drm_display_info *info,
>> +					       const struct drm_display_mode *mode)
> 
> [Severity: High]
> This is a pre-existing issue, but since these helpers are being exposed for
> MST bridge reuse, does it cause problems that the info parameter is ignored?
> 
> Inside msm_dp_display_mode_valid(), the code checks capabilities against
> dp->connector->display_info instead of using the provided info parameter:
> 
> 	if ((drm_mode_is_420_only(&dp->connector->display_info, mode) &&
> 	     msm_dp_display->panel->vsc_sdp_supported) ||
> 	     msm_dp_wide_bus_available(dp))
> 		mode_pclk_khz /= 2;
> 
> If this is used for an MST stream, won't this validate the mode against the
> main DP connector's capabilities rather than the specific MST sink's
> capabilities?
> 
When MST call it , will pass corresponding *info.
> [ ... ]
> 
>> @@ -1406,11 +1403,9 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>>   	return 0;
>>   }
>>   
>> -void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>> -				 struct drm_atomic_commit *state)
>> +void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
>> +				  struct drm_atomic_commit *state)
>>   {
>> -	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
>> -	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
>>   	struct drm_crtc *crtc;
>>   	struct drm_crtc_state *crtc_state;
>>   	int rc = 0;
>> @@ -1419,7 +1414,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>>   	crtc = drm_atomic_get_new_crtc_for_encoder(state,
>> -						   drm_bridge->encoder);
>> +						   msm_dp_display->bridge->encoder);
> 
> [Severity: High]
> Will this hardcoded encoder lookup break MST support?
> 
> In an MST topology, each stream operates through its own distinct virtual
> drm_bridge and drm_encoder. By hardcoding msm_dp_display->bridge->encoder
> here, the primary DP encoder is used instead of the encoder for the specific
> bridge being updated.
> 
> If the primary encoder isn't participating in the MST stream's atomic commit,
> won't drm_atomic_get_new_crtc_for_encoder() return NULL and cause the
> helper to bail out silently without programming the mode?
> 
We will further refactor this in a follow-up patch series so that MST 
can use the corresponding APIs.
>>   	if (!crtc)
>>   		return;
>>   	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> 

