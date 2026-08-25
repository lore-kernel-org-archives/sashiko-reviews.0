Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116AB3F4854
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653342; cv=none; b=n9XDnzJzw8jILlukYsODnIjWQmg2y7kEMtpLIVIzIEJ8AKjhOMuRrV2ivSyziJ+ZWqQlwyXbdeJ7Orm4Ws4E5ruyqixA8T4Di0ufUZsSfkW/u0oKK+1/wrgnYmR4VUpEQy30XG5oFjMZHidXRDDoR5JR2ZeZcVMkz6nWGEZwPWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653342; c=relaxed/simple;
	bh=GJFDRhyTKtH6Izn8rdynEq5M44P1WOKHRma5Jb+MmHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqxemyAQMJ6fM1y4/zbDvtsIgIbCm+lTSuQ3S6ng/PW5+y/UZkIsDEJOyJ5rYgVY4VkWdM7vSDTZnhAmLJWddNJMUppivpnitAgBlmxQLL28m139Qt6ZkOgmfU/SvDgKiVsjLigv9dMbjDKrhobkPYIKiYLkXYzX/yZix2THz2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBlRRcsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwdEDgjF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBlRRcsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwdEDgjF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88LvN2387883
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 10:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJImmiv7g+WZA2AHfU3WCtfL
	PUFty20WPiJTUbvp1Ag=; b=gBlRRcsm6VGBowDqCGvfX7izQgyHi+Ec5eH55DIi
	016FTxr/oP1/15lHLxUnRcietucqlhUhe/2agOsKUOJ7IAWwDSO4xGdy4vPvS7DC
	tvg446bpGYHLpgPujnyrlFOp0LIR48SPKc6bcQKuaeinVdPmMvNQ33Zd81PCIXmG
	lRh8CVfcXosUeejGuMJbRo2tS/snyTHXVwZ4AASZlwScxfY2jVwWGHodoArRFPdl
	kOday5Qa2H4QL1W14phuo8N6rISbTrq9CGoAKnL6ntNhmCCllyHgt74QUUKtR8ah
	6HXTtT2du3YXZgcl3EtDjLmUDUdc0stcNlPZrIeD7H0T6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swrbh4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 10:22:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4f6ac06aso84464741cf.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653339; x=1788258139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJImmiv7g+WZA2AHfU3WCtfLPUFty20WPiJTUbvp1Ag=;
        b=SwdEDgjFLjXN8wBdIhecuWjKyVqGxE43V/OacBjpIG2Vfoo+gATWr1N4N5Gf6pTozz
         gEk2YvOhEzg3wmlgZ4WAyDQkUpfphYwV7ChCo08h+vr1DQN5h6yY7GgcRJjsbzgW/uzr
         zUs5QZWmA9s2yWQQZnyjnmZ/JwDHsV7Z8c26R8atQsclLmdAKGKqGsdLgT7RWPhR7HFq
         VlUX8/FFKZEvD2oOySHusk+CQZcHORymFO0uNUZD3ofdQlpvWmQDAEU1V1I50RtKTM8o
         hcJyejQcGioohVDikAgnVxZZUu779KOlsXw9F4OevIJdIW2ZYf0RSQNxGKkEtprLDfS/
         5zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653339; x=1788258139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJImmiv7g+WZA2AHfU3WCtfLPUFty20WPiJTUbvp1Ag=;
        b=BLYP4lQ+lsJ5z7eM89fj7pwV8RfuddxdP+8Dz16vXB++QtCClspx8IFmnh/5ZNmuBK
         JKYBl/haQwtKl5iHwNfJYbHme4W0sgo34nT3vmkTU29kLXWvjeGCEHwL9k+oWQxXeNBo
         G0zEdrCzYMgLo/LoVtZc3OsEhfRAO9N3jG7yPCPGAqR1l7wDWPl5No64QPjGmByOjmha
         6VX94AWyTAxaXFvmqAGk13Bf94BPyR+z4nDVNwaIikZwoHHKJQ44p6r+S3Y/3YmeB96x
         knN6VRYsctVcYR7CwRpG4MqFTs6BIH9lxFA6w40vJ6RptyDKOrcGvzdaOpj+PQJj3tiq
         FViA==
X-Gm-Message-State: AFuF++k9J6bEEe5kXe3j3XPy3Q8p0RL38v8DJT9R+krj21kqIJPFKkaH
	9JOOY9YKHLQOccA5mKpDjT2G2R4KjdpjGeKuXai3uYD2dAxf5pgZSWKDuSQg18vzbNSwWUHy1WW
	xGkVDdhCIxRsbNI1hEyL9sCdlse2U3NUYpVaiA4DZ5DaNuCX9nCXJpHzfAO4GeNWwRW3zTyLvXu
	qOWD0=
X-Gm-Gg: AR+sD12mhPSI3IRbG/4q+U6PWvfJXEakBWpPix95dM7GYfFMGs6O4CiYEV7kyrVLzVk
	qfV7xDvwhNu8fBSqwCMwW1DiygbjOWWDVcNrqFUl1PWp5AjBfztKrR9+fYfjak0FYCyqyGOwZhT
	bLR7PDA2v7R/H9NMKFm8lUZN2i56kBREZH4oZc/u3Oew0ISLqqp0slaR990eb0yOqUEzl8jjyzV
	4XtUe66sslGbtk8Rl8Y9a8xri3hQR0Eh6LBrEoN1oNrmjha/sixXf7FejzCTOE1+Agt2sI8SBlS
	LfW6KaF9WHlvf5Bn5OAtqmi/ejNVPjpPA8Ts4tSHkmSmNuGPInks5XRqLgiSmZCLo6IR8iTaQtR
	Dp6Gn5+dKk2xH
X-Received: by 2002:a05:622a:1816:b0:52d:92c1:b7b2 with SMTP id d75a77b69052e-52e2f05c281mr56398071cf.2.1787653338748;
        Tue, 25 Aug 2026 03:22:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1816:b0:52d:92c1:b7b2 with SMTP id d75a77b69052e-52e2f05c281mr56397561cf.2.1787653338216;
        Tue, 25 Aug 2026 03:22:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297c7dsm1666390166b.20.2026.08.25.03.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:22:17 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:22:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
Message-ID: <44tqqiftvfrooqx43v73ebfjwy7pdwvocpbutyefcqfslzi7e6@itpqiwpw4woj>
References: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
 <20260825100722.9CEA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825100722.9CEA41F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: CivjPvxcyJu1zeoD3xrS3tTjOZp7w4om
X-Proofpoint-GUID: CivjPvxcyJu1zeoD3xrS3tTjOZp7w4om
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfXwPFXfUsmOQu/
 Y3qFxEcGgjhNsdbYYBjqovBfu4RUrqfaQWXPixgAf35RXVLQ0taRoSkasK1D3MfbaWdlxTwj6mK
 CuRgzr7mowH3EMwbQONKbW5dKC8zU/A=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8d6cdc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_8os4LfOatdM_aO-9CsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfXx0VBFOGALKeb
 pcfCjljO8zf0dWKpB2JD8UsrImSQc4VrqvLk769wZONNf/Xc4smm9yjblDHpGZotkLMq96ptVSO
 kTDrRnUqgonO8C1JI10xgNohBuhSyp/CvqQLHtOl6MAOEY51VYEkXQI4QmIFzNflrFklmRZBwj1
 IvhjVdqT1BquF1KvUGmADV2WOd7+QDn856pGbc5lSQTd1ZM8sdk0f5NF0Nrjzd+VXFnZd1UG4bL
 YzoNyEJw2di57D4FI3llJyFC5tEbRzInMFbEWuzbVLawdLmnnTyMYAsNGBiw+HzHptzn6KfTF0K
 SHOLUs8vPuipFmm7NOU93aR7QbwRYj7EkciPfI2VUS8FysBkXUW4a/ikZntZ+NgqIn34Lon1wkd
 cQtO+6gJL2BAja/aLWFfuxxlNmlAo4o92cNSnuCgPXMNYLuIbZOJZQRcq7Qy4cQ7GwO8lPc8wLx
 2zn5+aXTI/ODb/FN8zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087

On 26-08-25 10:07:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Incorrect macro used for a clock specifier in devicetree (PHY ID used instead of clock ID).
> --
> 
> --- Patch [1]: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC ---
> commit d454bba6f2028b4ff89f276f88a76156819977d9
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC
> 
> This commit connects the QMP PHY USB3 output to the GCC clock controller
> so the USB3 PHY pipe clock can propagate to the USB controller.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> > index 66ea4aaafd73a..2e0fbbfcc47d3 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> > @@ -655,7 +655,7 @@ gcc: clock-controller@100000 {
> >  				 <&ufs_mem_phy 0>,
> >  				 <&ufs_mem_phy 1>,
> >  				 <&ufs_mem_phy 2>,
> > -				 <0>;
> > +				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> 
> [Severity: Low]
> Does this use the correct macro for a clock specifier?
> 
> It looks like the PHY ID macro QMP_USB43DP_USB3_PHY is being used here
> instead of the clock ID macro QMP_USB43DP_USB3_PIPE_CLK. While both macros
> currently evaluate to 0 and might not cause functional issues right now,
> using a PHY ID for a clock reference makes the device tree fragile to
> future macro changes and violates the expected bindings.

Good catch. Will fix in v2.
