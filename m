Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6AA494A0E
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995516; cv=none; b=iEhMtbckf+yOZOpeBP7CZTtyK78oaqOgERiHvGCAHoVmBt7A0I7ZL0Q5ErkGHhjoquyUNcEStl7K6HinptIvdC2regFgmnyK+yJeXGkOzAV/npb7X/Zi/sjJHAz00JoFM2gJAVH/4poxuETSqOCZ+8gBlqahp9zEGbbD5FUsbC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995516; c=relaxed/simple;
	bh=ppwH5AyVWNDgtp8lr3ptYQmneuinXr2jilL3vzdVDiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2GdHvJOjbthcoraVjL2g2sCT6rXWQ9QEFC75zB0on5K/fezHzAn3Q8wruJyXXpp2hcLijKbrIERwoUg8CE66k4xlQnluisSOMRYifeRfJOAQz3OTWWLmLXIruYoXNeOQ3Ykws0Jb06jJDrCW2YYw0SP8VYsMCyCPiOl0hr/3rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RivaN+R6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuOX5Ty5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RivaN+R6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuOX5Ty5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628ehE33049477
	for <sashiko-reviews@lists.linux.dev>; Thu, 2 Jul 2026 12:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f+dyP/KejBAaN80AUuoYjKUW
	9BvdcKtcvdbJ90bFZOc=; b=RivaN+R61L7Li8hv2lio5WLDjAZPz1nFRNiAKMA4
	L73Y1/vxoR5jfsjGvAWDofGs8mOMGHpZcZQqTF2ZxNsJ3KQ3S1F7FWpaGm3hyhRv
	/UgV4e7uoMRsPq3nRNzytkLTMFsRSh5HVdqPv+pWkPks4t48v5xu6mahP22DN4Ir
	ERWjlhiEBnwGkXFqHHIj314skAUuMK4IgaMOMOUbS5GS4IWb2yAzsH+iYhH+BycG
	PD8+xs8/3pIRtWjv43Ch3B23KJ+n2uuHlaIM4A4s6Fi2B3QVOor7tZC3Ja8ArPOm
	meHim6VlFzpX79JwkMYcVCoa39ZRuB3b0ktXsPkuFS/Zdg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vput-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 12:31:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-969289fca9dso371813241.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995513; x=1783600313; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f+dyP/KejBAaN80AUuoYjKUW9BvdcKtcvdbJ90bFZOc=;
        b=cuOX5Ty5q7TNLcnGgSVRJkvuu2LvvIqCwGo4qx+pT42aJko5JWyDqbFA87qIMPXnoJ
         dj5qDuJGrXc53yg+kAyVdmPy33VWS8fH869JHrEMKS9X6VxIYqdCa+fwVxN7s/DywcKO
         b8KTuoZ5a3U3dr8wP7YwES7CEk12sbc0D/4d/hgHxnoSVy54Gwp4QSJ9cil0Lznswkik
         sXpo/zemXhFvzt09At4N1CAfsAoRRGZ1Fi5yazrB40F/OKZCjO0p2dooWCmQd29Vxsi9
         4/k0yL/H2fzPMD+teghCa+XKb8IhZMoTKvZKDmbTx0csTF3VmWC1JLbQexsJhyMn1vjx
         PRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995513; x=1783600313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+dyP/KejBAaN80AUuoYjKUW9BvdcKtcvdbJ90bFZOc=;
        b=J5NvFptb/L8fyltHkzJSceCt+Bxhf7ZVd/GKrB4LqzEpYjYOriPOr9lkCzljddkcnr
         0WJQvfIB8M9ZrT0ge3ZELOXUop+jgTIjugDwVb9LjUl+213bRums6l65R3UNay8T3Vn0
         pdRCnphsHKCaWMPK42AzpIHsM/H+6RffvhkoXI7LMrADDYpYkQRfLiiE+G5irl3jansp
         JQsWi2rEUw58kivjVIysDmTFr22re3U2NgwS57fMizOt2I2fufP9ChSbxWWRJo7GH6nX
         G4PUg7Svmwk5frpGCglMAlRB0IeCl72zjK42Io7abxSaNVaAxfUVPoj6QSxWXpcjLVLD
         /6wA==
X-Gm-Message-State: AOJu0Yxsrmw0jFc1tC21HnvGhCwxuVCxOepE2CPTw+fxv0xml8/LWN9S
	FNpNRZ6aYhNQUB9mC0N/qwUB9jRK3Oj3YSixAU5uWtV38XGOkRW9bUvIN9t5+gNxj5uEXDgO/93
	Ed7us3X/70nukzibWvCJpmFJtXDl73co2+ojpoXYoKHJiGdWlVg0qoEjrEDU6jeM5S3FzFAM=
X-Gm-Gg: AfdE7ckTwTX8tZuj/MIN/to7hK50y/Eu6e0wIZU2TTVCIvTtlIXyr2PLsOZWd1RIVGP
	hSSCw2zg9IL3ee7fDlFXk+7Lnn0JvtZNhfBci4mQKSteTYtWOy3X4aKxCpqTlsyCV0JsiKWzmnT
	jUDq5XBk4PktSpwZZoAzAOyZTMZlXkQ4xZ0EbOzzQGcMVgULCJJtE/Zz+phYM5u6kYQFU4DKsrG
	AEXuEK7FG+F2lhGFH9qj+vG66uqIx6sc3NlKjK4/2+TDSeO7AD3yvourxgYHDKPFm3mvS1PiEXG
	CqHGzXhUQTlqxpA8ZPFYGQnJSw+f/q1XIYDC8IO1IM55XblxgwUbwGOFNruQCfC/WwwNiCKVjhX
	E3lMxfewI64lAeBrRT4Z07sOPj32SGYAjpNL05UJar9HfXnhnrXCcrfH9yFrzS8e/xQRxI9t02m
	iFP4dqiLlsJcf3Sg5hAocUwqpX
X-Received: by 2002:a05:6122:660d:b0:5bb:74c1:e2fe with SMTP id 71dfb90a1353d-5bddf7181a7mr2298605e0c.13.1782995512860;
        Thu, 02 Jul 2026 05:31:52 -0700 (PDT)
X-Received: by 2002:a05:6122:660d:b0:5bb:74c1:e2fe with SMTP id 71dfb90a1353d-5bddf7181a7mr2298596e0c.13.1782995512414;
        Thu, 02 Jul 2026 05:31:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dc55esm654980e87.66.2026.07.02.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:51 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:31:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/msm/hdmi_bridge: Simplify register bit updates
Message-ID: <f4vlbpxv3tuxv3hbko3t2qgtht5ofeyqiculq4ri6k44b4cznn@wqhzvj534m7o>
References: <20260702-drm-msm-hdmi-cleanup-v2-0-a4a4f0e8895b@oss.qualcomm.com>
 <20260702-drm-msm-hdmi-cleanup-v2-1-a4a4f0e8895b@oss.qualcomm.com>
 <20260702094921.3DC7D1F00A3D@smtp.kernel.org>
 <01cafc67-adb4-4240-9c45-af835c4269e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01cafc67-adb4-4240-9c45-af835c4269e0@oss.qualcomm.com>
X-Proofpoint-GUID: ycwV9hELFVn64hoHMAwlIKswQwX6r5zH
X-Proofpoint-ORIG-GUID: ycwV9hELFVn64hoHMAwlIKswQwX6r5zH
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a465a39 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=7LRuesX3pLBna_ijODoA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMSBTYWx0ZWRfXwhgawILirofS
 q+Ma1QBnNhRjuX0wJcvbBkJmYJ/t84MaZ6Puj9Q3N2Vqj3ZG7uSq9jLqVIgY5uaG2yylQn4xHSe
 X1eIY6TDmbROj8dNcfg2Yal8zmFANM6D9BIGGLQYNjxHZxpf9mSxkgXB48iDpaogDtbGzCG2CH8
 xWD2THGprdTE0LCE62j9kemPwGAtmOWPn7zDxiW3cVvVXWYcwJOX6QkN01atJVRRy+ytvcoVWjO
 I+39M4oZ/xmdm8Do16zTHWwafBBhhIQkSdfexEx50cFvTswHVp6Yf0zKCA0T7mIm1h47uf4rk4Z
 ea+ix2scet7D2ME2L2qId3PyaNS1OSZDw5Q0qkrDB6G2OnrBtYFwHOVFjZdy/BXlkvOar11LuEe
 RVZGSTn415JODaf6RQ8sjnR2RZi5FM+zxEbtUAcJVBhgzTnezlf259tCWvotyy8DV3+EfOVK23h
 TnEx2xGMuQcC3wPCK0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMSBTYWx0ZWRfXzt6IvDi9LNwY
 KsN6obtswGSawDLZCBISxvybxiJkLfxVpEVFYC+PmMUU6cQVL7VI7bWU8nAbKfWkJsQpt+o1D5V
 bFUn7FS9bzmp5XxWPBhqUxeulRcxW3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020131

On Thu, Jul 02, 2026 at 11:59:07AM +0200, Krzysztof Kozlowski wrote:
> On 02/07/2026 11:49, sashiko-bot@kernel.org wrote:
> 
> > 
> > Because HDMI_GEN_PKT_CTRL_GENERIC1_LINE() generates a multi-bit field,
> > passing the data value as the mask means any zero bits in the computed
> > value will not be cleared from the register during the update.
> > 
> > This works in the current code because the register is cleared earlier
> > in msm_hdmi_bridge_clear_spd_infoframe(), but does passing the data as
> > the mask defeat the purpose of the hdmi_update_bits API?
> 
> The code is correct but I could make it more obvious or intentional by
> using here in the mask HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK.
> 
> OTOH, existing code is very simple and obvious, so not sure if worth.
> 
> Dmitry, you reviewed it, so let me know if I should change it to
> dedicated mask following above tool review.
> 

I htink it's correct and fine.

-- 
With best wishes
Dmitry
