Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678C3EF649
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089598; cv=none; b=X3gireZqCK2vjqmflFSqyA2a0EwAslEa1C9fez53LmkT+sE2H5tJPGT+qjH25hsggQND8qBeN9fhdkdEJ+BDmRZEy8dtzWUPaT1ednwMHnQXywggamMaZBxc+Y7JuGqrVkqNepLiGKcwVjCHulEJ51tqIa+lphXJypsSmEV9m9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089598; c=relaxed/simple;
	bh=bg+VWE6MfXT9eLHUSDEamofW4QaIQDSphisect44F6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALxsI51wij/JMamHkh+0tFpggMwHrnLh/I5mlnZ8fxVZ+80mPafHU1mkVmfIYK0XRMkoOuI71BoT/lYi+e9RZB6qMGf7sqkmTW1beYlI+FWSK3gBoxOdMxRiVlgBA2ZqkPW2oCwXrSGvawzKpR89HKx65k7Xzf5glbZESpy2I5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhdju0g0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUt4Q7ld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhdju0g0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUt4Q7ld"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BSaw13135377
	for <sashiko-reviews@lists.linux.dev>; Fri, 3 Jul 2026 14:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bHg7lvuTQiP4rs9t5UUICjFZjlWX9GlGLv8T1O/9mNE=; b=Rhdju0g0MPyREp/J
	fauq9qtuH10VZM7YwgfhZcILF7og22DaY86rBgWeYLMgZg8G723RgLkqdc814uwK
	BdU3/znWR+XAPMGWKwjekBvxgaAbaQlNZDC4WjPb4I7/AFsjVvjjE8FHOAghEdA2
	q9xE+aYGET9HC66AxWHzbQ5fJH9utPPFGGufGZej3WyaCJ/q9juFvcAziygDgJHq
	1WRla7kuxky8R4MH+/78ot9SqoQnmWF97gl46aOzqkpY8Wvb27rpZetCokm7IsfS
	E7ed0CmFt1JsvCHwmmVU6a+Jqt0cXwi42e1oz3A77A7vYY/ZthHpMKIAst6bnUmz
	pIdnrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcjgcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 14:39:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811279d51aso1209025a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783089594; x=1783694394; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bHg7lvuTQiP4rs9t5UUICjFZjlWX9GlGLv8T1O/9mNE=;
        b=kUt4Q7ldHTwASBgoq2lNI7j4cr7XYRP+xkuwmVBpPYjKtT5phgwnE6aeL7F1vi8dOn
         MQ3LFG8JU+z2lI8X22eJDer7wVA7vKnjsB/0mf9uqm4VrO5gSmWJ8OnhxkBWDArLZqYZ
         wLDLuefZOZqjod6l7byOarBUmcU6mNv2U9JcIuejoopKYXHavperHXmupiWHuDVuu52b
         zw8jeUJEQNUofcLdZzP9aNL4zFMZS8trvcrP3yrcW5wbbhKTo/HCy0pIzSX0ot18UqUs
         0ZzN5KbMuiVw1epC+0T3ADj5f47ykOZNQRDtny8AwMNDcqhH/DtJ7u8xieDkFTw+X3Xj
         ULVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089594; x=1783694394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHg7lvuTQiP4rs9t5UUICjFZjlWX9GlGLv8T1O/9mNE=;
        b=NdqjtzdN4uAgN9ft4QUNS2mqsznkFw7oER/9vdEvdF+GdckOQlwa6jLhQUp+Um7bUO
         cA23UuV36Ftkl3wtd9cqTbIpyEx7HlcjgTcpK33PsXdS5MQ+gBEZew6zHhu0EGlt8awo
         gQE6bLLsFP7vgauejaG6s0jhwEsYp+XVcRMK2c3FFmCO/BGbopjYcaEr077J5lUUIAKu
         fSuUr549naUdFCsjtCXiPN2LziMPKdBLJijnYjwlJ7Varqil3ZfmsmvwG94Ny3Fowi/R
         RHBSWvEDE1y8rMV+kQtJQMx3zP0i+GdS+peXyeaKrYCO7yzAqCmlOERJ/bpq3I9i0ZJg
         sq9w==
X-Gm-Message-State: AOJu0Ywe8D2en4oWV2PIxaiv/KT9f6fD4q96/MBhDKTdYFqnQK5tuPoa
	XMRVeXMsLpws+eYEmIGEhza0YbBZzSM3iQoX12gKWpp3rCGQMdvtwlccyDKIUjXaZ/o4gRdKlyU
	MtoZ6ydvMYRGzOmp3jZVGvT2rGcjtfylHj+jTMgN/ZuFAafZMfQzhkJdsH2hoMBGy0HlsHntIsN
	r/5iA=
X-Gm-Gg: AfdE7cmtQRLkIJOpdjBklg3Sfptds5rRqQmTft9LQvuGal3RtwZt0OlEC24p/Fws8hj
	WKl/DdMzcOLMwXwlUkzGBz9QinJn9st/X7fac9aRoFj58cuAKoBN0v+1/m0yX43Ud+IvRdd/evf
	Jv2GI0m7qZiwexqJPZOKpZNrSK+xmsMMAN8eVfri1M/JWyD4GiCUQT0XxdB+zFSgcGSsIRtwUjO
	wnJK9gDQJupZ90+K92zoH13L8Cx6AcNi+ZPwSDG15kD381zXMa6PW8wtJv4m3DxTjH+b7206Qf3
	Ef7hcgDzYkxZagPgAWh0AffEleoNUKKRgljpUWlpVIrm7ByY870Bi6ZmyTmMfTIYMRMjCQ5OosG
	oAO6VDQE7qekchqwx2vH5gUs2w9BzhIcJrV15jhAbpOY5q3LxJ/QF7Nv4LaSH
X-Received: by 2002:a17:90b:57e8:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-380ba94f8a0mr11654372a91.22.1783089593578;
        Fri, 03 Jul 2026 07:39:53 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-380ba94f8a0mr11654336a91.22.1783089592956;
        Fri, 03 Jul 2026 07:39:52 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3d92c44bsm22468eec.19.2026.07.03.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:39:52 -0700 (PDT)
Date: Fri, 3 Jul 2026 07:39:50 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <akfJtu0dJFFBoTF5@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
 <20260703123728.2CD5C1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703123728.2CD5C1F00AC4@smtp.kernel.org>
X-Proofpoint-GUID: MHe0JYrc-wj_-eBiMghDKLkA1BvrzFrb
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47c9ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_JvEUGRjuUHn2I_QtWgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: MHe0JYrc-wj_-eBiMghDKLkA1BvrzFrb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX8RxoCmk26fS7
 vP1DWrvbkJjf108kdZdIbvZU6PBz/xPvcPVeLgmYMzA2kDncDZRcih4nlE/AskzkKQuqEXD+J10
 CJvkeqT7XwJSOPmMoFk65312CpzSiPoXEWEbnRtGFFDL3PsYigi2fzs86a8Kb8WKk9ENGja9/Cl
 MJhGejFQlXTPJ1VLRr4Hap+cOPV/oDNkRxMD6XG00oJsTcNiB0EVMWdOQBAg1Ox192zYxO/7dkH
 5ZlJ+Tj+dnKvDy7G9AZ5PVulDCzrmLDkNh6smK/rIUOY8VZzh2ZGsafv267ha8Ex6QY/QLdyBLw
 caC6I9xzU/daFSnjHKzLFtzuM2D+I/QG8AFjTXTyS4A+g9ODWbgDGcjCCJG5+xkQsklXyY95f6Z
 OZHFzyUn/dwhYx4wmUMNuViDsZQRuh/X7VGfwapsg1JowhDiZO7eQpabJT40nFqxHJkDAb+5gJd
 sNo+WcxlybF6vmlPEKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX/QM4KOhxrXjD
 uqQMZS+6ZnS/Jt2mmTvXO34ORzgsDScMRYey/5l/5j7RsIfDL4EAsNXJ4XlLn6iY6PssShATxwv
 vbYVcQk7c3kIl1TZn/mkrOTSQYzZ1/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030144

On Fri, Jul 03, 2026 at 12:37:27PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Device tree nodes in `reserved-memory` are no longer sorted by unit-address.
> --
> 
> commit a19a73590d416c9dc7623921d49433687e8ae84f
> Author: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> arm64: dts: qcom: fix SoCCP memory mappings for Glymur
> 
> This commit updates the SoCCP and SoCCP DTB memory regions to match the
> Glymur v21 memory map release requirements.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> [ ... ]
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccp_mem: soccp@88e00000 {
> > +			reg = <0x0 0x88e00000 0x0 0x400000>;
> >  			no-map;
> >  		};
> 
> [Severity: Low]
> This isn't a bug, but should these nodes be reordered to maintain ascending
> unit-address order?
> 
> By changing the addresses here, soccpdtb@89200000 now structurally appears
> before soccp@88e00000, which breaks the conventional ascending sort order
> for reserved-memory nodes.

Indeed, this has been an oversight. I will spin up a revision later to address
this.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com?part=2
