Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93202429CD2
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787189; cv=none; b=aQu+Ms4KvS9wfaRVhDEb677BCp6zdLqbpC/gOjOW0aNamqPH/yOFRQg4sj6zKSI55KL+wSE8TLx4cread2oOl2nBsS4iHhJsIZW8xkb3gsCSCCsUxqJLIZvbgesfUlkf1DfGCK9RXeVorPn7k6WMve3ga76DwdNnyf0CgjV6jd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787189; c=relaxed/simple;
	bh=WgcI26FeoEdWG7ZPdDnmzjzv5QVIEhBxYmSWfdbLxkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYTkY2K4NyD5VtjyRBW3EWY8vH6mBtsV+G3iuG1MldW2D630gjwwVrZd4dv+igtCO+TeSYysJrO8qQdtU4RGDRNFBJhHI2XLbf8SWX2XqoqNU3W5POIEwgYa6J+S9f7bLN13ZyWUZord2bsXPzmdsvKP7xGNg0h9wv/1NWf/ydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8+KyANs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDNwLw57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8+KyANs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDNwLw57"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDvF004211
	for <sashiko-reviews@lists.linux.dev>; Mon, 7 Sep 2026 13:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2YcGSOzVcathbMGrauMsKb7vtcdXz92tDZk77j/tjWA=; b=P8+KyANst6/u4em3
	KEliQpfBJueTsQAYAW8Xg6mfTWf9Yu8MchBPPBU/S3bXuQfjXDHJib+dro0o4lRs
	f8abG8qk4knhhwiEh8dY4zpFsD1v3epK1vJ3D1KjVn5fADPydXIVUTTBdZUO8vR+
	5KEgXydBz1K4e6/JbWndbIqxTyNgV2YZbdYIBSsIULAsLmNqvro3lGifxIzu3LYF
	1NBD/BtVNbrtxV9e6RxZivp6u9BK73hPr5kWVGlvnfXDge73J2furTlHt3Zr1zg9
	DZUfUz/xBxvTW62Bm3aX7MTpTXH/6gzxOWsGnbYmxY9fRkAY3OZco2yuFou9VVF/
	qMcrNQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg15tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 13:19:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e80385dbso738679137.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787180; x=1789391980; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YcGSOzVcathbMGrauMsKb7vtcdXz92tDZk77j/tjWA=;
        b=KDNwLw57apMAKo+tNuMZKIum6zBwZpAwlzdlekIth30WzGdGfOEPgXGTeJC663rImi
         XaqQeqzQYAcSf02uKau13PI51jXrPOnNj3rUCfkdomcEcyuDpiOsffJIpRtj3T5uqDIu
         LrZ/5hz3+sT88D0BQaiVfNVaZ49Gljebs16FoPHeFUIzQtqIdoJpDTwKsWsy+39Mejbp
         +l4M4q6VTijeZMnG2S2/4zj1fntg1k631a01qxH6UTKXmDev8q8AF3I2oACxxnKtkzj7
         ckeLkPyBtEhoIZ7I5uc0mVYD3iEiA3VBgQUTdUs0VvKhnnRag3KTMHfdT7PMn52sDqNV
         w6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787180; x=1789391980;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YcGSOzVcathbMGrauMsKb7vtcdXz92tDZk77j/tjWA=;
        b=ZPxineHSvrx2WROXTdLOnS0zySFXQldYTTXtwzF/3DEz9DxYeS55/F/waBNVTUxiWT
         m2Ya6l3VhvZ3og1KA/3KHpEzmFYEvDPCnnZNXHFr3/yf2LK+wENlciwrzhPAAWcwFO2Y
         gOnklWarcXxW68RibIfDePY/92sz41KS24bmG0K7L8G2+LNnK6q18XXJNAPn++AYk575
         yKBkeAp6X9eDCGH+VzOCPdK/mB911cHca4n+tB1ct2RL5syqPNykBIdDQ1ipMDOgkBDe
         e5OeJZ156VpWYRYx9rRtIKtAvh44FBLnUCd0iqu27Y4ZHZmpG1eAyt4YixrEoqB6NBk5
         hPuQ==
X-Gm-Message-State: AFuF++neSo/By7Zq7GcMfFvmy243TCprg458rqQU/zypEJAcrpkVU/0k
	VgD7GSPeYMKKLnQTeFCj07rFJ5z/cdB1Uq3mHkvvm4l/WE5Z7gRUXiv6ZZhfGVCAO+338j5/YO3
	ddRxiQwNUH98ZadkCqOKwwDLko7CkFOv/z6yNXpe3GlOaByxjnNU2oLvatjliB3XGxq2NwBdCjQ
	gpg3s=
X-Gm-Gg: AYBFou1+7NK0h9fRnYJRzvXbKUvktCLTky/4NI0+UNWu6XQc0Eye5SISCJLrRxI9vid
	qLrwpntmYsM+POg+L78jKNCDlRbTVVXdW88rGSM6bo1wR6di1h32McJp7Tk7c3fNINDoF2vvl5K
	guOPWzmzcG1Ps32SXFmEke+Mdtx0CBB11T8ENOkMvPuDZ6pc70lpFekxelWOuRu3Mu6821WSVR2
	1xZAQ9KfEoa4GPTFbUVER3dECg2ctTADalMG2zz6O+B11UFZpJYFA7yHoLpYzTdfTeRZKf1fJA1
	fjiUzxYWS2apF9fXZgV4bUNU4aXZSWOV3OzG3lrQSDIpAfHPrEA7kmyZ8zeGBGga2TUD1zdj+Cf
	1tL/TXZmAnFkoUECmKxucC3p3OdbS
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id ada2fe7eead31-78a4a91077bmr7376241137.9.1788787180012;
        Mon, 07 Sep 2026 06:19:40 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id ada2fe7eead31-78a4a91077bmr7376211137.9.1788787179534;
        Mon, 07 Sep 2026 06:19:39 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm424350915e9.5.2026.09.07.06.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:19:38 -0700 (PDT)
Message-ID: <ab27c2fe-1a0b-459c-90b0-62eaab286cc1@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:19:36 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org, conor+dt@kernel.org
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-2-b097cf1eac77@oss.qualcomm.com>
 <20260907131419.D9BEF1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907131419.D9BEF1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfX3i9Yrwua0igC
 n888oPOm/ixtsaWnofoprF4fgjYiZ0A/p9apUonGkJcmrXwjO3Gfqkt3fDO9azeegjOTYpXlnQ9
 B1rjVPP4gbhKCzq+arIDzbM6qkAHfG+DEcC0myz0N0smynnp/OgtX93v6MCYRqFxKGNk5hyxF2l
 r+ZK17NdDj1OEiLoKqsvKXi7Ft6YL0lp20/5bXc53aODmzDItUACrRj/kHSrX8wuqkIy94X7I6o
 bI7Nh0TQJbPFMNLH/drCC+Azxz29B7zoAiLbIedDCCSnB3m7DH94PWjyPcfxy6IFHLd9YAyoneJ
 pr9QCR6OusR6VJ6W3GtBgfOOCArciFVNyv+4LJ27hnftz6c0BE42fd6O2nhTFa0YVpbyKjJ/o1V
 OTPPNekZClx/GichI2gECXjQViyGSAbLV6yhW1d6FFx9mFTyna2HmPtXgQh1o3+2cZ4HFyHKZWK
 wUIrknFh9d6l19I+pZQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb9ec cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cqV9-yYPM6X3oF6Ldn8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: gOsMt6IkYbn_t_i5dxiQZj8O89L9H8IT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfXxGE6lo/oGewf
 W1CRpPJD1a1kb0BCv33wqI7sSa7HVIhu7e09w2BIOiCRiD9FH3wamdfk/ArOvy9+wRXIHx+LjwP
 3gWZSxPWfAEw0Ki985wRQ01cJ2ygoG0=
X-Proofpoint-GUID: gOsMt6IkYbn_t_i5dxiQZj8O89L9H8IT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070147

On 07/09/2026 15:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Imprecise abort (kernel panic) in .atomic_post_disable() due to unclocked MMIO access after a failure in .atomic_pre_enable().
> --
> 
> commit 4f4c185244ef7ea6a900e7c373d8e29c18ab92a6
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
>     drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
>     
>     Properly handle power up failures during .atomic_pre_enable() by
>     aborting the .atomic_pre_enable() to avoid accessing registers why
>     blocks did not bring up.  Otherwise this could lead to imprecise aborts
>     when accessing MMIO while entire power domain is off.
> 
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> index 157f19bd90b4e..db85400e574e4 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> [ ... ]
>> @@ -287,13 +294,18 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>>  
>>  	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
>>  
>> -	mutex_lock(&hdmi->state_mutex);
>> -	if (!hdmi->power_on) {
>> -		msm_hdmi_phy_resource_enable(phy);
>> -		msm_hdmi_power_on(bridge);
>> -		hdmi->power_on = true;
>> +	scoped_guard(mutex, &hdmi->state_mutex) {
>> +		if (!hdmi->power_on) {
>> +			if (msm_hdmi_phy_resource_enable(phy))
>> +				return;
>> +
>> +			if (msm_hdmi_power_on(bridge)) {
>> +				msm_hdmi_phy_resource_disable(phy);
>> +				return;
>> +			}
>> +			hdmi->power_on = true;
>> +		}
>>  	}
> 
> [Severity: High]
> Does this early return cause an imprecise abort during atomic_post_disable()?
> 
> Since atomic_pre_enable() returns void, the DRM core will consider the state

That's a atomic_pre_enable() problem.

> committed even if it returns early here. This leaves hdmi->power_on = false
> and the PHY clocks and PM domain powered off.

Pre-existing design.


Best regards,
Krzysztof
