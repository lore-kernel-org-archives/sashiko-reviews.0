Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0A317161
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283802; cv=none; b=e9fdLMihOUznx3kVFWe8LODBYJNWXsMzjGFIQNCeCAorftAlZ087+1kinAWAdU6petABBkf0zibjmGVQhx3fgyeks8vph6TL7TWf/sue1K/vrrZxpowFbB2ZcZhWwH8ue0ghJ0/Bp5vVTDkj7AR6ixkntwPWKC7HegPzlc5CTu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283802; c=relaxed/simple;
	bh=wjtwCOjjTvgQ+HrIg2iU3Xvguk/orqpRv48VaOoSMPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiYyBbgxk9VBDtkdUi5bPlbbxasvoVnh7gjiu8vJCdnAMFePWxD0uJO7nR2bl4170Jpe4EaW01LdNT46cY5zNWekNJu9kOKX8biXoVnzPWQWeurkCUf475tT2xnl3lUNe22MwVCTQkPk0J0RehX8mbgh2WqzSUPea1INZnRnPGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVfDZ4eT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYWbUzL0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVfDZ4eT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYWbUzL0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHSe2098529
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdu3irNj+KTWgR7xMpoE4z/EjpwdFaLI83sqipED4Cw=; b=pVfDZ4eTmry4ifXN
	VrHS9uy7rZzw8mLnI6y52YAEcj+4VijRB4AqALjD2RNnILal4i04nrEU8sVJmc28
	8EEikTkvYNqTsB4MA0mZ3TNKm5Rvi1tp9D4sBtH5vEmKGr1UipjJLF2i1I9WhcX8
	Y8Z1wCesgPK0c64WGegfBS10oeL9WpnDgtR5Vw0cAMc9ZUVTtqd4XCAyOz5bjNrR
	+pu/YC2zTd3jJvtwo2KJUvzkP5xy+Wv72A49Xm9PNTv3US5EfGkXT5Ow4MxuT4nU
	8FkGczeIlFrWt2NNUNvmMcpHQlVIaXJtwNPELOGG4dJU6d+Z4P09AGJvICScINIe
	JaBRfQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6k8fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 10:23:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso104302095ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784283799; x=1784888599; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdu3irNj+KTWgR7xMpoE4z/EjpwdFaLI83sqipED4Cw=;
        b=WYWbUzL0Qiet+/lgXbNiOV6zVOGBDeVg3JTHJOqqOazhmYVL0uH3fR6Q3fT22fa+3P
         qyS2gXQNu+Wn5Zur1sv+2UwqBDoNgA5fZQ48BYR1xsT/2HOFUeyxzSzPwC8TDbHDtnLd
         6VKT3suu33gB5ToSM4wdIyWLYbD3doDKEbtzu0s/08RshEOHnS2LJ2c38GNWXYtUdWmJ
         xEJFL6zuzAG/GjTvvheD6IejWRZgIs4Ox7GuBT+lYxw5tnEO+3dq3ccKBwQA8vdACjko
         5fdwPVIICTgyFGY85YLzjB+HXC4KqZn7vTPaqtGh38ui1iAKlZZ6VxkDadMYrmM+nDjX
         lvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283799; x=1784888599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wdu3irNj+KTWgR7xMpoE4z/EjpwdFaLI83sqipED4Cw=;
        b=GOX2clDk86LoAE8INEenjNlSjVhG0HqsLYHbmYVyu9E0nZTxqEo3qzYXCLtqCocjFl
         5pRuKLRCy7tAOdxeZTmRFtV2VMP3IQP9hW/9kjIrRkgh+p0ucYZgSUPsVI3oUNdpATwI
         8RdRkCWJPaj0AuUJubGlS2/c1LqRQBgZtSuGgIHOz5ghDowQTQwX0XGswglLUaa+OP2w
         m5zZJrQQumFRjV/uwTq8xvioU5eE4E1gsp5g+YfBeDEdsF7RNlUH3yGMKi0nibknhFm8
         h0LRwuzyE2MB3+dVDk7Gii7YblxbLpiK9x5D/+A19WIXY7FAH7XKw2bpWV+Zn+rtpUUk
         Rsbw==
X-Gm-Message-State: AOJu0Yy0KwidP5rajNLaZf2gTni8xZcXhQwooSrpfHxO5b7IZDBIk5P1
	i8+CcqzsuG7/0il2qiG3nf0LaBUsNLjbuGBOc8z4DTH0l+kg/o9aeIXdmDEWvjpsWvuto+VCqqC
	uCfaeJ3waBeCbT84+Uh9A3//FItW9jTB7CZa+0ebcxz96BoY+vCgf9LfJy1W+KKNRuh5b5IWfjX
	CvLj4=
X-Gm-Gg: AfdE7cmRmSgPn+WiYMbEJ4lHpeYP7+IR7mfv2OJGWqIdP+z+uHGca8arF+hv7pSw5++
	x2Fbb30Uu4U1vmBVXkBb2eLunpLfDmLuuARvGuMjO8iaOvoUGb10Ie/ypr3QWlAuTMd/8LlEQQf
	RyfXKdZ1LFLcELLSZwMyIDQH+7iMaoQYOmP00SSn+nGLNlr1qSFrx/XsaFxbJEOgiV9Ftjl1q6b
	1U9gjnqMnLMQre+mFvyD87/CeKn97MCNpAAuvrMm/CK6QHesYtHl4Uy2zEBM+uGjj4oe22hdlhc
	kqhMomTrtiMsTUaGexjzCKs/pvX3EkdizL+y0C2WakOPdaVSpMgtRwINmD91vjl4R4h2sey6D4i
	WH3VC7Ar1hYwp6DTs4KQ4HhkTaF5c9EXIACveKBHqzIyg5ow=
X-Received: by 2002:a17:902:fdae:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2cf3466a93fmr21891095ad.0.1784283799072;
        Fri, 17 Jul 2026 03:23:19 -0700 (PDT)
X-Received: by 2002:a17:902:fdae:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2cf3466a93fmr21890895ad.0.1784283798587;
        Fri, 17 Jul 2026 03:23:18 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db2d9sm8079975ad.43.2026.07.17.03.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:23:18 -0700 (PDT)
Date: Fri, 17 Jul 2026 03:23:16 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <aloClFTsTpiszExR@hu-qianyu-lv.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
 <20260713-tcsr_qref_0714-v9-1-373670ab15f9@oss.qualcomm.com>
 <20260714050953.BACC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714050953.BACC51F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwNCBTYWx0ZWRfX3MG9N9nH56N0
 sWHarxlW8NfHlr67tokJ0EQKwXSdav64zx32rycgmB3CdmCE4XvdSeo6aLnuRCydc9QXGkuQLwR
 jCR+UimIw5TWv7sFtJHNUhFVRv2NVERu/ju36a40VmeD1eUKUgnRZYMijGtLZMA9w4oKFNI4Be5
 xa01+aQFirMOTGUUgJIDnp45TtyBGaabYHiIcvykywnJreaHBirF6PCkssJAm36bJrzqEio7pwT
 yCXW3gGUJzNc23rpRPY/A9lP1DJTayKaWIRqMPl0kcAqTgOoNL+kiebrIlPc5l2jkHmjiaF2i0/
 IA3FnSn2SB7ESiyhQVSrb/s27I9vDWJtpoLHef/YfDrSs+ZCPrsMjUDeD3iMKjsrjn62URgo7Iv
 a0Unfzgxq7EhDyr3PUSUiHkPPLDVpLdUzHHRooplquAhPbe+DEr6v4QbyLkiNg980EGkOyDxXxJ
 3KBxgLWB+eWyl5ZBjFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwNCBTYWx0ZWRfX6aMsB4kp+ggl
 wodZvmplTogiVFCWb/b5I3pw41gZkfbs/ZsrIQv6wNqyYdCpwnlYuQfG9M5STkyAWfhHyixiTTh
 lIu27QGWV2rJ3Mj7VTK3RROiB7erITM=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5a0297 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=s8IvIF-zRrWUOPtcMVsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: hBZt82hbWSBSNsbGPVkjPA1CRCLIuwST
X-Proofpoint-ORIG-GUID: hBZt82hbWSBSNsbGPVkjPA1CRCLIuwST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170104

On Tue, Jul 14, 2026 at 05:09:53AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added qcom,glymur-tcsr.yaml binding marks 17 `vdda-qref*` supply properties as unconditionally required, but existing device trees do not provide them, causing a `dtbs_check` validation regression.
> --
> 
> --- Patch [1]: [PATCH v9 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own binding ---
> commit 6bffb0197809346112dba264dc91035d8e1ed982
> Author: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom: Move glymur TCSR to own binding
> 
> This commit extracts the Glymur TCSR block into its own dedicated YAML binding
> file and documents the supply properties required by the QREF block. It uses
> an allOf conditional block to enforce these supplies for the qcom,glymur-tcsr
> compatible string.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > new file mode 100644
> > index 0000000000000..ec89feff89e4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> [ ... ]
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,glymur-tcsr
> > +    then:
> > +      required:
> > +        - vdda-qrefrpt0-0p9-supply
> > +        - vdda-qrefrpt1-0p9-supply
> 
> [Severity: Medium]
> Does this cause a dtbs_check validation regression for existing platforms?
> 
> By marking these 17 vdda-qref* supply properties as unconditionally required
> in the allOf block, validation will fail for existing device trees (such as
> arch/arm64/boot/dts/qcom/glymur.dtsi) that use the qcom,glymur-tcsr
> compatible string but do not yet provide these supplies.
> 
> Would it be better to introduce these properties as optional first, or ensure
> the corresponding device tree updates are included in the same patch series
> to prevent breaking schema validation?
>
This yaml only is used by glymur and mahua so these properties only affect
them. I have provided all qref/refgen LDOs they require and did the dtb
check, no warnings or errors.

- Qiang Yu
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com?part=1
