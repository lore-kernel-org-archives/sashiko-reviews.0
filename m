Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C70C46DFF7
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787279; cv=none; b=iuN2QLTWC0WRirStpGFiMU10MjUWdcx11hTWKbx5ZjwfWIivvvdUR14rco/cdpaNN1nP/gi7xIg79/hX1dN/V2LBTvNyjXtlYHvXw+edaJui8bUGLvzGEBynsqeXMFuQTWVhQMGjFmHHrPpK2E2EPtAcmfgTtqqGgzjud9+c/4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787279; c=relaxed/simple;
	bh=/XIZqFfdVQkuDvteTMW0O5cPAjeEEx9jLqyoOitZWbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzhIf4V9nqEekG3iQpQelcpWqbI0sG9ST7wVArYGPWjCQHDzCHbg7OBG6rBLXoBvGCz2l4R7rUZVSzsEy7d3qzxgFWR+3XsA1h8BrCjQPPg9ynhnmDXqrq0svobtrAYT1h174/ARQ/W2FO1QId/YXaBn8iPNm6Hvn5DPMeZjgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh5M1pc4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lz9TRC3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh5M1pc4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lz9TRC3E"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmvUZ3349045
	for <sashiko-reviews@lists.linux.dev>; Mon, 7 Sep 2026 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xudgVfXyg3OdcNE0RyNDSehp05AOljIo3nyACCtorEM=; b=Jh5M1pc4+HLHenES
	w+6+ZuFEQ3QKeFO927PD26azciMaTIo3shePfsaNN7OKFI7xRis2bqprMxvfqWga
	weRLB4EjBLeqBo8sXC71m0h/B3xk5eXzcaiXmAODd2ekwrppATljpbVHBS3YH0vZ
	0VkJ1WjShTx7y6tNICNpHxMeG1JWt32y2QJ+3G6I3wvqDGHj8DCH2yJVjqCAmFf0
	UkEZNEYgTJKTaYHbWaWnTZRVnZLC0MpCQeZgDwcalYsK7+F1AYFu8bTX9wtpmXZt
	9ZcDtaFWtUFAjM6V9f3D5zTzIFQtzXWRQP3SYTd3l7z4byCJp3TtJzKI7cDDv8iQ
	DAiRsA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0xb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 13:21:14 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb0a317c4so384847241.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787273; x=1789392073; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xudgVfXyg3OdcNE0RyNDSehp05AOljIo3nyACCtorEM=;
        b=Lz9TRC3ETNjrbkTLJ9hNJTqr8yx5IAmXlPS++pVLeuaSKtU68hOFqYjaBnbKlmqHSs
         D83HaR8lxwbUSOO99qx5C/SfUbbZh4HW0CXxlcqDqHR1r0bQ1LXHa8xcs5sHhA4aB9aL
         CDHjSqo/ubDI+nqs0oJ0zFobmOoUHZyEQ0+phWggO+1S5UqYWwaL6bxqVnM5xIX+kaft
         L0DyWgFVcVFr27IB6QB05kkHFSsHC4TBv6xg2jt3jAL5zW+gIojYSea4U6x23P5OOXRF
         gHvkSJfoG0lLtwxil98GJ78qZracRh90iIgX/B90f/69cXstiCgARbXF3dQBuHWjWOdz
         bZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787273; x=1789392073;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xudgVfXyg3OdcNE0RyNDSehp05AOljIo3nyACCtorEM=;
        b=bNG9NyzMS9EnJktpWo2/OwXtbGrfYQW/x58WACwuah9czeI1uLQQ0k0P84Sz/7uT/5
         4fxVtn0ImNHzs2gR8cZzBdIKJrEfbu3h8qEnBbd1rdZWOkg4jt5mpEfjzKnmN6fRgS5w
         8SgnF2FwbJkuhKA9Luiyqahcti/+/lEZ23GvYO+2bTDz06iMyeBQdppxtXEY5Ub+Bjbi
         Xs1LL2G0loWSZzTYHoNOY3o+3JSbg2saq/OmbgxbyVaPqMNbBXxTOaaTYEKz3iEFDUbG
         6HsXYzC/whzpIrTzN5++MI7CIpP7yEpUufghTNCCtxMiqBHOSTrXkd0tHdinMi17jeAV
         n2eg==
X-Gm-Message-State: AFuF++mtH859UpEp52eU5AUw0sGu3W1XitCr7PkBcHHQYX2JFctpSnPb
	gfSQe9c7NIRQkyI5Q5Eab5exnn8Jw9CXPaJOVQNycW3JphV2pcqGN5n3gLRnXjaf50Lyc5x+rJW
	EiM1EOI8WROPJDycBnfeMyFDoT2+E+hKofQwqFAcGlB8kwoonyAetsYMrQYNQUrf0jK/O94X0sV
	44QJw=
X-Gm-Gg: AYBFou1TM4h+kCnjyej0MoKaVMgokbckUSWuYKqj3AWLggtFn/bKqr7kQu0p6wKR9bX
	tpVkV8yl7Xt5FVgFWHjcCFIv2zPTvDRJPSQIL3MDBjfaZoh8lw/kWFSmIGzQmCn59x5WRrf+Hje
	O/4bOpCfk5eGEnn3rt9xJNcqDiMqvAOkzOMfs3Iy/lo9bepwb+gEqaQQFHLCoX1D28bxAeNWSo3
	oJwqMY68iI0aoPMvx78ESbjQ9nbJvblJ2p3hmA49UQBc9/p+w/gcD9BO72xrXZOaf70bSyF9ulR
	i/LXCEoiIaMYc30m5IH3nApHnjRY7w1V3KJQ1LQN4bBi2RqQHr6K6I4TSghWcR8IZZdtsDAKXwl
	kkGa/8o8F6ZYZ1KwmZVjx+3/dWreJ
X-Received: by 2002:a05:6102:a19c:20b0:78d:31e7:e02 with SMTP id ada2fe7eead31-78d31e73347mr920597137.4.1788787273305;
        Mon, 07 Sep 2026 06:21:13 -0700 (PDT)
X-Received: by 2002:a05:6102:a19c:20b0:78d:31e7:e02 with SMTP id ada2fe7eead31-78d31e73347mr920584137.4.1788787272846;
        Mon, 07 Sep 2026 06:21:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm23951535f8f.19.2026.09.07.06.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:21:12 -0700 (PDT)
Message-ID: <9d03c776-b05e-4037-b7c4-6ed817882edb@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:21:10 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-3-b097cf1eac77@oss.qualcomm.com>
 <20260907131153.34AD21F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907131153.34AD21F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9eba4a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=zC86WEiMApjGDmIPK9MA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: Q-oi56QLQffn76cAATMh3THYl34kLpSZ
X-Proofpoint-ORIG-GUID: Q-oi56QLQffn76cAATMh3THYl34kLpSZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfX9r7d55mlD7FB
 /IT7uec1/nCfxghIeMEDgLwNtsoT2M7UfK8uiavCnnh/rEsN1814ZUBnOo/KAr3/8jXVSmS1vsP
 EZLmC5or9lRh6JBE0oW3IsUs3MVtVB8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfX0B6MIbLwNYRC
 qKJcMeQtSOdmGBPUOUcJuSaHF8r8g4BDcycn7WvUQzmrgmiTPcSEPSjFWWQK7PbgbJMI+UrWoJ2
 FGJ84GVINrc7hsXhbLYh4ppzzvSYLZwWWKIMqnYBzplKTONnlahbvmq6x1ypXwuMRzrxWXfHpeu
 gtfBSPpI5Ki9XQCGo6w6UH9r+bpoPbOSKu8LVrEQz5A6N3pIZGZiaDCHP2tW1j3XR1EBLqTKBRz
 VTTVnbZJW/2O/N6i1haJ2SgsS+C6jezv6M/JLv0uxKiHML/Cv0Ax2YBih/+XeQtq+GHALJlKd3n
 J47s0adq3IrBRyPhS4ydI7ZNZWIJNv0abO+0qScwurSfpvEetTh4gqJkTeH+R74c+0/uQ01wYx8
 EEMrkPbsBp8hM6QkVNSUd3/RtBkwPHD0qD4h7lb3DyQasRGxPMYcd7QQ12eDS+n3qOmDMMNU/Hl
 v0KGSVwtpvbY8o6EBOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070146

On 07/09/2026 15:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Moving `hdmi->power_on = false` to after `msm_hdmi_audio_update()` breaks the audio hardware disablement logic, leaving the audio engine active before its power is cut.

Ack



Best regards,
Krzysztof
