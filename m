Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BAE33AD9A
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256133; cv=none; b=AnDP0d30zhLxsObKT1F1qPXqVtOSeED/44kixEjROdHtsrkKl1kR6OMlDL+AjEhK/pJlxkgjD+5GiI8e5Prs9lFTqqDOzBlFQgIWQnB9VyNa2YfTcv1yyHV/VmKQ2zQR8cwLTXis2ijCBmKfu1l6pcjWfnZ8unu7QEKfuKVCsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256133; c=relaxed/simple;
	bh=2YroMzWQpgcp7BviRncc+162Wh06NdBcQ7jprbW8CKE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ijGEijwYuyFUvPhBaAD8QnPtS9lfHj+31nSqWdX6wP0RsD3Oi1QvqD+X9bdZ8DbToKLjbihgp5ZYTn4X+nq3cOxX+zDIg6lawwUhZG7ycNtvDJf5TtUCYo5ay9/9NLBqgM5t6E7Z64/5LpywtrGM9C5NlE1H7g+p95QMdxoLM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUGmOFV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWeVnmvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUGmOFV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWeVnmvS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNJb3K4026941
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E5PcsKP8MMsqwKd5TU75FBn8OJDje6C+VZryog6VtDQ=; b=OUGmOFV8X/X65iEl
	xTxqo+/DSYttxR3DbBG+nenY+wtH4Cyl6eHyQLMA538PBZ6FMmA5DY4GlJBWgSn/
	kDRMv8U4rPdIcYhiDEQ5N0G4fDgnpkazvDQZz5w/OCwDooTh/fiJAuiXMRCze3OC
	rRhAI639HxNlvX2/PUwgEVh4zRy6a9jyOLAVsnd2omDDyYeXJDon4TpX27fzJoN0
	Dllxv0mJELSmocm/KmWNtDDoTo8UCuChGFRwnz5IaxMmdPlZEJ6HvvRf+cOL3td0
	db8setEFfeBmKEM0TYrO+fg2b11Zrzvv/8ofSUxThUTf4X+vlkPCGDBNpfOKgk3E
	c2kOPg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8hpp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c354050c34so118815895ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 19:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784256119; x=1784860919; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5PcsKP8MMsqwKd5TU75FBn8OJDje6C+VZryog6VtDQ=;
        b=dWeVnmvSDGyZ8u+2VGvFyNj3AoAr8cxZ2qlREbf6arOLx0m8HseNMVNrHIl7G3tgxr
         rSqHVHf9PIdIlplBGpAGVvmg+zSA1DiYGrK7MbCCiI+TXoEPfNkQN8xaD9op/LwUoiTS
         pYOAHHsvsdQ9ylQ/0B1wH3HsSr1XTGaf3MiqWBP7PqaePyrE3i/H/VPN6bNUTC/8QfVj
         +oShTRzpLk4exBJKqe6Zu+SsTtDGBvepuRlLmzTyMS36L4eNgsGCT+8TIYszAuo3k0ie
         f0B/am+YE9CW1YQwIKAoWCHtuRqCdXb6q8OnW2h7rlmmtsogSv1gXeuz5CKK07jxJXCO
         2bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256119; x=1784860919;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5PcsKP8MMsqwKd5TU75FBn8OJDje6C+VZryog6VtDQ=;
        b=JAKEwPBSm89W8vxZhU+UprMrOi/WLJnX1znelAnKJQqyHZpvpz8DjJiOv2YWLEUIzH
         TR/1IgUryeDVVbOT7m1QFMoasFNSMBNDR8N5b4gmfuj035n5D914WXDTWuNnQZ/UUr7T
         k0Vrb/jBrJ/BhjoZIA6iRQGTwyExrvbxLIfozv3X6OUP61v+RJf6AKcoV21UNgZBEsPi
         AT1fBF1GfRWMkzqdD3c0i3K9rSwjffv4FFyteS48kudhVf0Rf2eomkyFgtjJZz1+rov1
         tA3Brt0FIi7mQaKptPBmY0dPcsFyj/Pn5pgN1zQHVX/Mf6Ycj7zUj6UTq4G48ceErBwM
         tDWA==
X-Gm-Message-State: AOJu0YyRtoPp4Tx1Talo+uUSydVLzy0SOf6x6kxDc8xGOYxbBNUbYewM
	uev6xfpaaYUcUUlZu25yN0zXeg6EPTSwtlqlfuiyFdEFWBQlxyxJ2cKPv0rxfTuUvZDCNyVYJCt
	HtHBN6Bb09IhBmJDZbDJLyXs7rLI3UsdV4zEgGTb93Js0BiRQ2fwNJtIqfkVQmOF1L1PoOnv6iS
	UHcXg=
X-Gm-Gg: AfdE7cknAUIvAPs1kNnGxDD59bIQJNXSGSXWchI71d/2VtNthsY9Nc3UT61O+v19llO
	acpkaha23xdVrTSpNTu1fwm2EyxzldqeUgnFHTGwsPXqhpYila1W7PISPWZO/aTBnuD9WkeK9ZD
	kgswPKJnjQAMCw09YUkb+3+SvGxnZ3OxrnP8kCOMJ0jWjyalfHg4ygt+BKlei5kofsjrvKUPEEw
	izwCAOQNQG5U5S/3EKR2ejTlqjscoNetKKxZBksUPrRUtu8NdASO66tcG/0XPSaHlfTEoPOYU9V
	FjIrDTdElxQNp55S+QVd5WC1aYrEuzQQWI+89WHb6W/TzVay/Q3V2Q6VlWMyrN7glWgdfjA6kVh
	Smekx99/wYyT4ugJpzxP1bEzV7aAMhllcgKsoyFJYmv2sN9YRtDwPuudYRaH2qxXeNmOjYdxU
X-Received: by 2002:a17:903:1b03:b0:2ce:d957:59c6 with SMTP id d9443c01a7336-2cf349bbf7fmr6773605ad.30.1784256118686;
        Thu, 16 Jul 2026 19:41:58 -0700 (PDT)
X-Received: by 2002:a17:903:1b03:b0:2ce:d957:59c6 with SMTP id d9443c01a7336-2cf349bbf7fmr6773425ad.30.1784256118176;
        Thu, 16 Jul 2026 19:41:58 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347166e6sm2267625ad.59.2026.07.16.19.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 19:41:57 -0700 (PDT)
Message-ID: <09e28aef-cee6-48b7-bd8f-74cb7c4c0eb4@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:41:55 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v7 12/15] drm/msm/dp: simplify link and clock disable
 sequence
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260609-dp_mstclean-v7-12-ea04113e8233@oss.qualcomm.com>
 <20260609100223.4726E1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260609100223.4726E1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YNMeX4lh_h0dTIYxsNQuKQ_litezGjo6
X-Proofpoint-ORIG-GUID: YNMeX4lh_h0dTIYxsNQuKQ_litezGjo6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfX8fD/53Or3E3N
 IU5vSDx4eXHCdwiGvTvQtgURP6TXmRuZJvobEhfd/3StXuNbNEan8hJmUdthavGC3eUz/D3vt1h
 8fgin+zdX7idsiBGDm6Bepmz5MA2IsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfX8pX6sCI7Smi9
 T4YF8P1ssvHWKS/B1PxhQTbBByH6fu+RUqmVJ6OU6F+Fgm6cabasbKSrcg2mthrkF8+LDWWPoK6
 opbWoqjhZHuIzxfAQ0Ik3fwrLHS6zlA4NfhmZKBPs3kASXoEbKLidDsZ/XcJiuZGBAn2SgV5ehh
 /C2uuOMcuJmsquZyqX1qApv3ekIgFM5dSyIS1G7nakm6imHVtMouVo80mmjXOFiH7b6WJdNBD47
 KI1+twMQvK/aM+Fc+m4nbr2cIkTq560m7+FC9XrTCBDbHwXUZPF0wHsSOdKfezugcgTIWUQsh5A
 tv0EHFLwYa1AiFynjJ/wjqMRZhn/NWXdz/JtX58uQ4f3z/oPXx38j3xGbys2KaUWKQswR9P59Td
 mY8vxa1vEwhalbZgtJDL1qcnB+kdrSt/BjQmi6OylLBVGYWnMyCeSQO4HJzxr+VIutOQOD8l61w
 jCXtT/26fJORgiCzHFg==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a599677 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7szLq90EWCkCOodppdgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170023



On 6/9/2026 6:02 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch introduces a Time-of-Check to Time-of-Use (TOCTOU) race by splitting a single `sink_count` evaluation into two unprotected checks, risking an inconsistent hardware disable sequence.
> --
> 
> commit 4b86b22d6f1aa41eba1cece8a907cf0b3a12b55c
> Author: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> drm/msm/dp: simplify link and clock disable sequence
> 
> This patch refactors the disable sequence by pulling common steps out
> of the sink_count condition block to simplify the flow.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> [ ... ]
>> @@ -716,27 +716,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>>   
>>   	msm_dp_panel_disable_vsc_sdp(dp->panel);
>>   
>> -	/* dongle is still connected but sinks are disconnected */
>> -	if (dp->link->sink_count == 0) {
> [ ... ]
>> +	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
>>   
>> -		/* set dongle to D3 (power off) mode */
>> +	/* dongle is still connected but sinks are disconnected */
>> +	if (dp->link->sink_count == 0)
>>   		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
>> -		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
>> -		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
>> +
>> +	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
>> +
>> +	if (dp->link->sink_count == 0)
> 
> [Severity: High]
> Could this double-evaluation of dp->link->sink_count introduce a race
> condition?
> 
> The original code checked dp->link->sink_count == 0 exactly once. By
> checking it twice, if an asynchronously processed HPD IRQ event modifies
> the sink_count between the two checks, could the driver execute a
> mismatched hardware disable sequence?
> 
> For instance, if sink_count changes from 0 to 1 after the first check,
> the driver would perform msm_dp_link_psm_config(), but then take the
> else branch and call msm_dp_display_host_phy_exit() below. This would
> leave the PHY completely powered down, potentially breaking the ability
> to detect future dongle disconnects.
> 
> Would it be safer to read sink_count once into a local variable and
> evaluate the local variable for both conditions?
> 
No. Here is safe. No one will update it when link off.
>> +		/* re-init the PHY so that we can listen to Dongle disconnect */
>>   		msm_dp_ctrl_reinit_phy(dp->ctrl);
>> -	} else {
>> -		/*
>> -		 * unplugged interrupt
>> -		 * dongle unplugged out of DUT
>> -		 */
>> -		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
>> -		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
>> +	else
>>   		msm_dp_display_host_phy_exit(dp);
>> -	}
>>   
>>   	msm_dp_display->power_on = false;
> 

