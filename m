Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20D44BCABE
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714761; cv=none; b=kLZJfzrC4FbEEol7oSqEtJlbRobS4STi1rK81WtcDXJq7LrV0kz0bUs8zyuheu9uMnAdKhk47U2dTRhlvArtROWvyCp8Tmxdv1ISrLoN+yquEK99zw9K8ss2LHl4264AjWAE0Pd2p/KupytVC8oRbIYCP2Ey+N0OtbNr6ngvnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714761; c=relaxed/simple;
	bh=TvM8/Otac478JXV26Q4663S+m71LZ9oqVUnSWjse1Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIN+MeyxtN/ru4ZGSpMA5xTzH+dcvu6XWanNpfZgjmkfNcF5TEhwvGczPJYlNE4HevVmHnjrx5EYq3O88vMuFMz4FOZQX8Wu7vpEyJ21i+23/0l98+rCfyRflM9miJjJnNIr3Su9D9EPKJ/RhaUjqbSCh8eE8kagB+tIVyYzrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeYymHx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeaswLf5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeYymHx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeaswLf5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xa6V269720
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3y0SFK0V4UHyO/2Kx4oChwG3
	TM8bZ6zhVkNNhAztNpQ=; b=NeYymHx5387ttPLpaEA4iXFw+8BKDonR6Z6ZE07+
	agLO1S8sBmTEFnlk6GAL9kiBNCk7DfqQxEA7Lk/0Abm4RFkVBE2cf7K1+kf14pAq
	WZVe3XA+qewTdHvrLM3KZkpJQAJSq0GiQ4AuTg5Y69qQsK43+2r4aBGt9mRCegoI
	6NRm34tQoQa6qYfuJTD7kkDanOWvUG/F/ivmAMWqrotyrIEpddcPEqcU0X5+hWCh
	DXiLgcfPxKBRnzJv2g2cbhI2Sx6Z89GRQ1agkgKkuQ5URhdStlTvQpVrm1Yn1BQQ
	aCvbihoTw/57liAOOFBSzLOK8ceXIx/4/hWXza/w0VeMCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6abeu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:05:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so180728451cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784714756; x=1785319556; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3y0SFK0V4UHyO/2Kx4oChwG3TM8bZ6zhVkNNhAztNpQ=;
        b=QeaswLf5t7YbiMvq2ckV3avpbTnMak7zAkAdmITe+0HWAQSl+VXiuZBJh1gUdXJB1Q
         2FUXLD+ANTk/0veBUhIeFztqrsw8kJuZ8sXIbGV2nofK1ku/bc9f7ebQxu/6q619MuJp
         /zlrFkAwQc0xaozgm17DfjsZ34X/xnHtOXVbuCnSRm9sJ3Bz1ji8BSHljI0smiXK9lnG
         QuhsLCcJ7AU3ICawQTzyzM8Be9mwNBH7cmu9j6Yw2OGkHTPUINC5paiDCJ1n4Wn83op5
         UHVY1mCLUJ36O3Ld7BiZt24mjFW7qtAgbnNgLkAEjrCYewVKSvp9S7rXFqToXA4IPxvr
         9CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714756; x=1785319556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y0SFK0V4UHyO/2Kx4oChwG3TM8bZ6zhVkNNhAztNpQ=;
        b=oxEMwZFLHMIr7V0G8ZT5vvHpQK4M7Y4nYC8WHoLBvzIuX1Tle+GfNXnw+RlE1k9J/O
         dAq0bNLqkfzeepVziLhpHYfw4roHF6IxJxz03p/QgVEkHYHHUQkyEMTSgLmhIaQEfrp6
         wbLD2K4WgEq97WeKjEePlnt6rSArJFGaHieA9lipO8rnWzACgSXxVI89y1ryo1gPsFmL
         i9agRqCmNwIfb3QjL1/75kqM0C76N/vGHAKXNLLNW34OxIrYzmTtBvG0lUCbpLwiC9X6
         GOJ8EGMf8TS1NFqNJWJJfQKhMdnBNkg3SwGXPjXzg+Z+c9L3WfoGOt392wJcccXfxQEQ
         Oneg==
X-Gm-Message-State: AOJu0YzT6f7CJgM0rO3LFVTvKvLOh/bGbAw7+9knjbif3sAz4Idpay1n
	snbQNztwLuTvEbS5VtU7Jg2UXPjgkx09zOFYiFkNmQUZ+kNNWOz/zBooQtmlB8UuiitNCBMW3KJ
	W8dUosqIys+NJjVvADq5RtBiUnsBfG7uCpmktIN2NSFj84K1VV/Km6EZ+pdeTeamyJWYH6ZguCJ
	vpFak=
X-Gm-Gg: AR+sD13RS7YRb2BXQ5CfGppqN3NfSfomu0dXvkvu/2KkEp+2L5/c2RFGq4JO2op5s6w
	aWpiTCLCmirXU0R1cPnTVR94JNMam3y3AG/DI1iwOtFun821adqaIlPt3PO969ecTMXQX5EKnzq
	01tHD05Jgi+o7paf7WucFB2Dy//kjny61e727JNqkF0GtyeLefKdZSbkNLorERqu6UAPTRIUAVB
	02feFdK57mlCFcUvgujfJqgtRFZsUmJ/7cZ3KBe9rga+GCkAZe0C08+I1kn43/P8wFCUf9Ne0gD
	B+3j46JcXe5tQTd2RUgKis8wsijs/s1hwfxm9Ig5PyHF/iM+b4LwPZqg+0PG+VWdhDV4Wk3Q/uu
	85M/I4qwyWMduHbs=
X-Received: by 2002:a05:622a:410:b0:51c:8fb:fa45 with SMTP id d75a77b69052e-5213e48affamr215859591cf.58.1784714756466;
        Wed, 22 Jul 2026 03:05:56 -0700 (PDT)
X-Received: by 2002:a05:622a:410:b0:51c:8fb:fa45 with SMTP id d75a77b69052e-5213e48affamr215859151cf.58.1784714755716;
        Wed, 22 Jul 2026 03:05:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956aae132csm38827275e9.0.2026.07.22.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:05:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:05:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move
 Eliza ADSP to SM8550 schema
Message-ID: <pwcdmgmfz4e2miuzqx2mnvovk3gqy7fkfjskte5frwydhvfw6y@otf25vznjv3r>
References: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
 <20260722-dts-qcom-eliza-fix-adsp-binding-v2-1-e1e98ae15533@oss.qualcomm.com>
 <20260722095149.0C9DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722095149.0C9DD1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5NiBTYWx0ZWRfX0cF2z0wk2x4p
 b/843J/GLb/+tce7MIIS05xL2SxpHIFAgT8c35wjWT+P3Db+Va18eWVyAHmaH0gzvsK3/ys+QBh
 5tC5WgTSPp0zsCmbp7iLGePWFxrVEMO9coK02mqQ7wk0KWaKvh95AyT8yWSHelLi5ke8BiPKhZo
 6mpZv3/B79sgnFXvAHbqWCA1nFmF9anKxNn+hHLtrVZ5S2OTwr2soShIzqt8PnTA7OYUpOtxJ7Z
 IV51tdibBo7boZl+wvfLWPow4Oa0up2jEv0xu0LM1iuDvEdOsni6rpZJJx+M8ArmrnXJxs+K6vU
 vdJ43/tOeAPp2avzVk+ZPX8VW38QAkC/rUAIQlRlDxrsJFo/jQd/L+iVXh+7/9dRpxwFW6WMA9H
 O+84t7a6EkqTCsKW+mzR8+rBu0vsCWO2PlOfyo1ZZJ6Sego1OWmC3JeaC1gSNfjNHSbmvuR0Jbd
 M5khvIY9UG/w1zIcpzA==
X-Proofpoint-GUID: AS_3lxi9i_oAyXFNSe-vlBGsxt7zST6O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5NiBTYWx0ZWRfX+RNC7iiFRekv
 q47RYdToekXvGNLjXBEnr/4sJke3qQUO1ZkF6Nrlg45J3mTymkYocoDUn+Zrlu9A4RYTANsOoy5
 huztvMVSqsGvUjNuffxpJIz6tsku7F0=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a609605 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x2fApNMNvfgBM2Ni8FsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: AS_3lxi9i_oAyXFNSe-vlBGsxt7zST6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220096

On 26-07-22 09:51:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Moving `qcom,eliza-adsp-pas` to an items list requiring a fallback breaks backward compatibility and schema validation for the existing in-tree device tree.
> --
> 
> --- Patch [1]: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema ---
> commit de0588624107f153559b1ce48e9d1f56b81467d0
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
> 
> The ADSP PAS found on Eliza SoC looks fully compatible with SM8750, which
> can fallback to SM8550 except for the extra interrupt ("shutdown-ack").
> So document its bindings in the SM8550 schema instead.
> 
> [ ... ]
> 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > index 2a4c527552e69..e6d81a38fd1c0 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > @@ -29,6 +29,7 @@ properties:
> >            - qcom,x1e80100-cdsp-pas
> >        - items:
> >            - enum:
> > +              - qcom,eliza-adsp-pas
> 
> [Severity: Medium]
> Will this break dtbs_check for existing device trees?
> 
> Looking at arch/arm64/boot/dts/qcom/eliza.dtsi, the compatible string is
> currently defined without the newly required fallback:
> 
> arch/arm64/boot/dts/qcom/eliza.dtsi:
> 		remoteproc_adsp: remoteproc@3000000 {
> 			compatible = "qcom,eliza-adsp-pas";
> 
> Since this schema change now strictly requires the items array to include
> the qcom,sm8550-adsp-pas fallback string, does this break backward
> compatibility and cause schema validation to fail for the existing in-tree
> device tree?

Nope. The only user of this compatible is the eliza.dtsi, which is
updated as part of this series to use fallback.
