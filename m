Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F9D3F1061
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856671; cv=none; b=JajEPi+/nIP7aJudG4v+B/YR1e5XKBE1/epG0c4pbwcEimYbYKzM9m4KE4WyKAZ2TkiqXimSaLAC1UUSGwElx776IU4wC9GJGsFLtD5WsCA2R9HDVMYi3CGfzyAr8jOYq/AdmSsH4+QXvT616TDAup+0AWtBXHFs+dQaVEb/9oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856671; c=relaxed/simple;
	bh=/Dk+CYpqa1NtS3R5uXh2wNhUk2AZ77m70NoR3pO2zZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amVQUzTt9+sXFrnz/Nh+ImXUlyExEc3wGJU25yOnlxTBIZeGtAIG9DDcGMqgcdtx7bzbOxK1NXay22w2B6jh4zJKgDaZD+FAsRRtxzzPTm5Sw72obKZ8/hIXbINNLHgSyYiNd1X75EFXt4QzqwYTM5GrG9gf/PT8gHzE962C2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaO2e8Eu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8EumnEf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaO2e8Eu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8EumnEf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LrdM2154211
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 08:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZTaGxO48p7y5EHqLgyxjGdy5PCz3+Tijey3+jZj03E=; b=MaO2e8Euaz4HQABZ
	XziflilKhZc4V7K/gf1k3DWHnRL0CBpuu3X0xhzr1d4+5Sw5cNvq5jNeuJkLPXc+
	xKI6MWA9yo7ETUl7aUhw9N2pNH1+GHhRBZvtLpSi4uFhzvJj2Ju///ehtNWYtNAy
	A7FFAU59d3lklwK0juKifK/1043S5ggHydiLv2LwRVIeHhsaA3fhKkmIyAHDNpAq
	z5pyensd1StF01VROFMJYF54DLwYYszIaRhOqJ50JnS7icwpa1EyUxIn95QUt8Qw
	p7TdtCMFnTvgwf/XRPMRd5vZxVvffJ85d3/88PZH8cQj7uOxGbknFHJIrObzrRcB
	eNvzww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjgxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 08:37:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec3146553so1041662785a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856669; x=1789461469; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZTaGxO48p7y5EHqLgyxjGdy5PCz3+Tijey3+jZj03E=;
        b=c8EumnEfhdpf20PIh4KgseNDHSjhiVji/6WK5wIDx5u6SUN1xuiGg5Mp7LgKLvPHED
         Du4zCA//TJV/jozFJ+seeCZyyGn2nNznm18Ctrx3z4gfVH0S9qVpq/4aLxlHoKATOir6
         OGC7doFLriTsgzeNXRpycRVELyk2WgwNYvXP8HGFhUFHIxMOUcHSBKWtAOiUR0wxRooH
         qd6jCNK904Sq1MSDb52IDf6hofXe4cGitN/+LMhkleXZ2DpEclAAQR+XmXYTtBAGbLIc
         HGILEUpQDtDmsBcR80VizjQDokpG62tMjDFZ5uUaOWnYyBmGVZkD4Xltqp1bF9ZW69/8
         68zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856669; x=1789461469;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZTaGxO48p7y5EHqLgyxjGdy5PCz3+Tijey3+jZj03E=;
        b=M/L8RfeIH41K8y7jE1pIA4xpqrrgPsuIvay1b4t9exJFUQ/oq9/YsQdRG7cDoinLL2
         Xpx40PU3w39kBPh9OU5uwtus2ZbkIL4SckGHFy6D+vsmKYwTP/xiMMNvAsyfC0RTxJ4S
         i8mXbZWRPYeupSCjqnDMoAfJtR5sbBQ19+LfMxmSgMzAHhfdszgYSgGNiQMJFZB/UGRd
         ZjLx0pbwtmZpeeTEp4+VL5z0zNiB7duFX7P/NlVgnXapyVtN9ZQSbfz3R/0/K8gO9PNA
         pY262TA3bZjvOrrnU+FUMSAYne6dlQZR6cvHdoujF9hkUcuavXG6d+V0+BN0Y4UatxG1
         9Hyg==
X-Gm-Message-State: AFuF++lR0BFPb8ZEU7B6LUA3rJMm4A90IYpD95zsKbOxJEI3/jWR9zSk
	vOYQKJg8Py7DA/meING13+OjINahGPhR5CVZsJmY/OzpR0RBJNmWusJAg0FAlz1iTYtl6XY4/GC
	tPgG9LpS3h/1Z4r+pQru1TYCwhCBRS+Fplmfskgd3gnc5qXIysKVwCjLYcyhWoYyUO6tVtSObZB
	tRGV0=
X-Gm-Gg: AYBFou1yfrsB/1DxE/L67HhOLThqsyFUlHLJWDmJab0Xp7Adj8hWiA+SwgCsXxCBLlQ
	tStU1U4KhFIrMc4Y/QXwXyPIAsI4SrPThxDovHXSIaSp1r1IjVOLEMFCyNjPnKor4GLf9UNffl1
	Pt/oQTj1zEHbxvzZtkTrGDAFHl5Tx2615/tnWvHf15Zmc7WAplnIDpfuY4bdboJPlMSix3kZCgj
	3D+3+xbU5kj0Y+Pdp891E/nKqpITJdxFy+Q8cSZxlSQ+Vgy1uYg6rvNhDI8lpPm3WF/wgZwt4fg
	RPcBA6K1mlM1qG9l30cEb2WVtid6I0GwgtNFjALMbt6wL+0XMbH0jnvX45Y6ku5xm/A5MO6Zd2Y
	CU+X742ZMQ1oTSqzrroHqEmD2JIuN
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr2891048385a.50.1788856668712;
        Tue, 08 Sep 2026 01:37:48 -0700 (PDT)
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr2891046685a.50.1788856668327;
        Tue, 08 Sep 2026 01:37:48 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c37csm563974466b.32.2026.09.08.01.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:37:47 -0700 (PDT)
Message-ID: <c7d1d6f2-4c47-4259-abf8-fdec33a27f95@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:37:45 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-2-dcf8956878ca@oss.qualcomm.com>
 <20260908072546.645FF1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908072546.645FF1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fc95d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=dYODrq4-AUaYJTIoUJAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfXy/pIamiySvtB
 R4SFDdW0uIKUoszheit+OYVp14M0xO9KtR9RM2YDqIJb8z+GKlVtWApnq+GnjwE7g6oo3PXAfzO
 /48fW3qpxOQUB9AsY2gqQ6MSLrv1FdPAfdorGi7DWVL5EsXRmaghqC+k8A2q86g23maVKLZAYMZ
 RkVe3IVKdcYfVrXZ9Fz5q6aakRPsN0G5OrEdjyDSR39Uv8Fa534nwvIq8zEeM89GV1kE+CyxAOe
 WQHCTGOZptH8JYt/c0DpmaDs0jPGB3oPRCviU6UZtTMvZ92iZ6z7sAT0EvxArguYKpOJ8qZIV5r
 z2jyfCpsArTNG3LAhLnu5tPrH2XTjv5zCZQv6q/JPC8jeuD1Y/eChwrhhc/GczG0mpYXGajFP7O
 SQy9hPPWCmqE4IajtohyCR1O4YzRP5WG86r25JBo/AzcbJI09VhfSCRe/qxKv/f5luE/0CXnxmd
 TVg8H8DPORRlmS8u5Eg==
X-Proofpoint-ORIG-GUID: 95x9ou1ntRTIWj9tvxpJMTPpfrafiKxt
X-Proofpoint-GUID: 95x9ou1ntRTIWj9tvxpJMTPpfrafiKxt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX7VYRZ6yS9oMI
 1CXhfCxZMWj/RdYPett87N8ustrAx713LkUJMk+CiBecqaZG9TPgjZeFOkln6jimHxD0JRb1B5j
 ZPcTtPc+VYc7SklGvp+p21LSCYLWz/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080090

On 08/09/2026 09:25, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Aborting `atomic_pre_enable()` on power-on failure guarantees an imprecise abort (system crash) in `atomic_post_disable()` due to unconditional accesses to unpowered PHY and HDMI controller registers.

Pre existing issue really.


> 
> Pre-existing issues:
> - [High] Unclocked MMIO access in `msm_hdmi_set_timings()` before the HDMI PM runtime is resumed.
> --
Best regards,
Krzysztof
