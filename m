Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25623A784A
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185016; cv=none; b=pf7rHusn7RuCs5rhC3eiZp/cGYTuF96OrJBY2DAEwn0mZPvs8YbLwNMLNArtwgWVmDz16w5oIQny18ZCxjBXxvlfkx7KvclkYXq+qDuLs+gJ6E+DzXcYVkp/l9+WRKk+q2NaCxWhywUo9HVATkKhR/g+P3LJzrUX0b1dfSorkyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185016; c=relaxed/simple;
	bh=kzhBehIAs4UFbTHjcorqhL0zXljuHrD+zdfXi3pBatE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4jY9ILFg9Be95Syvc3ISSU67zd0xQDcV4JqylkTNeV/0+NSAzYfYuGi5jWvUfst4KpuJQnQg0m1AN+jihZwx3gjexWQbVZWrBfa23ouLcDTOX8v0BrBN7gK+7ziQKeCC2BG0VYffv00dlbblHDhJVYL2ldTi/8n/bjK486WJwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5Ac7Cab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rwl6KDmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5Ac7Cab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rwl6KDmd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTedi595980
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 17:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z2LIMIvO9xx9VpTpkJ6YJGQbEYqEewvSeY8+Qz4XTcg=; b=F5Ac7Cab1l+fa2t5
	rDeAiQEiaJPPxcVWqUM4ZvwxmIfFHJEFlw6uWnsm6pDUIueLwHIaIhbU9lr0x5Wh
	VVygZeko33PySeFD8YrmGFNJIyUXrxY58K8doAuQDSGB2KyLxpVt4WqRM5OlJ+51
	JNN4eG3jTtb6zm3Ixx7oObG5PiLkEe0TxE8oAIPjM2eX6ACMXH2VkFj/hKxqAWpg
	zi2d+uQO69QlPiZULu4xfScNcFEfNpH2yj1VL8F+XiegiSHyMFRejbKDEki5UpcA
	uDTkAs3eZdgD5LDRhUtFNCsT9r5PkHCDxD8RQN7WzJaPAnsVieJ+KL/cnRmtvAyC
	cluV8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs75g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 17:36:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so783205a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790185013; x=1790789813; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2LIMIvO9xx9VpTpkJ6YJGQbEYqEewvSeY8+Qz4XTcg=;
        b=Rwl6KDmdyusctdp5/JyPfc/pFSIditlDvz9rBlu1uySaE86eBL7+/c9xeQ4weCDuul
         GT26bAybjoQjOgFiRxn4O7KWDiEF/2zHBuk0AAlVQCfNJ30shznwX9eLs1YcRMtR+Uq7
         ykGIt54zMMKhTzlej9TlHwZo62Gj+UjHOvj+JfsDNe82U2oBE5DDXH5dOS+CF1HBFGDv
         VMzne4TXYR7ORc21Xi/0Rq467QPbIAtukElcUQIbXdaG3bDJhtdGthUzIjnY4q9QVH2A
         pP4rCKc9CUlEOKFWFGVqs+24WxvZRmQIhTrztx4showVhMUvYGQCDEsEPiIFNp4AroGq
         T/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185013; x=1790789813;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z2LIMIvO9xx9VpTpkJ6YJGQbEYqEewvSeY8+Qz4XTcg=;
        b=ETkAIBRnmPeWSm0qyIHho8ltnbwQ7H5b0h3nyJJCMXxET3FSx6wC6rJtMYucc/F54E
         453pLvdJoNOLi1B79Mt/nqT/aecdv6GSX1xRkuqOdHaRC40pKg5nlzpbGaG6u4xj27r3
         mLONRH+mggZHse/o1RaYUdArJ4ygXcwnKlB3dU3TNEvQ/qEkGhhRefw8SE7zXcUUSP4S
         ENNNJPqTvxF7jPHOb60gynO/NdhcNJ7o65esiqTBl/eNB3FWsRtNSdRw2BD/wpDWraCl
         i8Siy31wSYSGsCu5C6QJKMgdaAjZApJoDb2cJPffHFe06fUfsWEsg26hK4I/qt3G4OEh
         bs+w==
X-Gm-Message-State: AFuF++nnHLOBeZKG2t9t2kcb7uhOjXHF8sqd06DQzX9MlGEsDzzGH9Dj
	CMVzjS2lw6ZKuR2N83E4L4NAemgbAbXOXIFkWT3XH5QPB19/jgO2SxiaKx7Wt8zQNrIYfhVDVj2
	6I5AefFJ/KV2Yu913z1eYJF3J5/57mER8GtrDSYYSxrYi2tZPGutz35TqybTjA7F/aoybbE1VQu
	3MJh4=
X-Gm-Gg: AYBFou07hgDEV4K5tubh21cVu+F77Fs81N1eKZdKBHc75jrTrVCb3mXyZHO9fQvWlhO
	jkngV340ltsPPJB9lI7Zc+cauv5keq7DsFGOrzfqC9mbE750uVUnb+FSFzCrxQK2Hz04K/jKaH1
	xJi9u8hf70Hl1qp41wmWuomMccUjAvSw59alq6tk1Jzesu9QZE1OY2OHwqStPYzWecwt0o+nwa9
	E8KwORpaSPMygkgcGBfZYJR6imxX9tQTvQEykcw/eHrXQy1mwiIgKo+VIRIisL66QTYJ3MnPO6d
	23Jdiq4FSDEJPqQ2IWCotPogbsykSDX0E6o8imrJ9uSJFVYs0kgtUcAG/F0V5oN9oW0dt1ACs44
	pCCBBmSmXFlGNgZ7zZlBBvim7Q7BKjm6t9yK0
X-Received: by 2002:a05:6a21:a41:b0:3da:bea4:621e with SMTP id adf61e73a8af0-3ddf7e7a6b3mr3083108637.26.1790185012805;
        Wed, 23 Sep 2026 10:36:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:a41:b0:3da:bea4:621e with SMTP id adf61e73a8af0-3ddf7e7a6b3mr3083025637.26.1790185010069;
        Wed, 23 Sep 2026 10:36:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfc09efsm1743697b3a.16.2026.09.23.10.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:36:49 -0700 (PDT)
Date: Wed, 23 Sep 2026 23:06:44 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Introduce Hawi SoC
Message-ID: <20260923173644.x5jda5lxokjtebd5@hu-mojha-hyd.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
 <20260922203818.E7BE11F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922203818.E7BE11F0089C@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: LFg5MMWVbLmm_Zn_A-BnK1yPABlu8n9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3MCBTYWx0ZWRfX8gJBD6acsvbZ
 oj3jdDllyCpXnTkDf2+IGx4kdmXgkB0EIBmwsHflqG6aZVUHe2DLjKc89qsil7r0ylBDcKEvuF3
 Q2e1UuVwqW/faY2oGz8azB9oDXbu/cweTiu7zENraVksq18dFgySQq7vFoRrYLLFFWAa1QjIIts
 XVMdgq8Q22c71BHIefC3Bo41xHXamFdkslWA3itTiPZFwaMael9tMsv9TG/u+mBVcGWfViSuxwP
 9+92VkHWWJV93HTCuOZZGwskwWrq5oUGDiVugb9iTrG0oWC55azrWi7JpoD31grq5Dq854kaxck
 8asZvAiU/385hMwj3KdcxBg7e/w44JrZ1YKT8LCHurOUYzPVRCivhfz07pXHg5rlDdaDOiM5VNI
 brvjrsZumKKgkMClb1Pcq/NlfgOFVJi+3Ljb5AaHZiNDo51ASzrIWSuGvBXFWwEAk62qO5+kVWT
 t/Qw0w5I3T2uyFpr4tQ==
X-Proofpoint-GUID: LFg5MMWVbLmm_Zn_A-BnK1yPABlu8n9t
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab40e35 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=HEPaDEBX9R-tSKdGgq0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3MCBTYWx0ZWRfX2uy1DkGu62WN
 hjMPvXNwkUjSRx2EnLMwjK+eb45NgHHQNEhaxsksVjRLKQEEJQX/WGqu47dqMs4J6z2JfF3c21K
 VksAnHO8exFDb4hQFwzSQv7TfTR0qR0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230070

On Tue, Sep 22, 2026 at 08:38:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dt: pcie iommu-map property missing mask cell
> --
> 
> commit b9bce85781ff89249270f3214ceed073984ef78e
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> arm64: dts: qcom: Introduce Hawi SoC
> 
> This commit introduces the device tree definition for the Qualcomm Hawi SoC.
> It adds a large number of nodes including CPUs, interrupts, timers, reserved
> memory, interconnects, SMMU, PCIe, USB, thermal zones, and remoteprocs.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
> > new file mode 100644
> > index 0000000000000..c7ae8133b9cdc
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
> 
> [ ... ]
> 
> > @@ -2957,8 +2957,8 @@
> >  
> >  			operating-points-v2 = <&pcie0_opp_table>;
> >  
> > +			iommu-map = <0 &apps_smmu 0x1000 0x1>,
> > +				    <0x100 &apps_smmu 0x1001 0x1>;
> 
> [Severity: High]
> Are we missing a mask cell for the SMMU specifier in this iommu-map property?
> 
> The apps_smmu node defines #iommu-cells = <2>, which means the iommu-map
> array requires 5 cells per tuple (rid-base, phandle, iommu-base-high, 
> iommu-base-low, length). Providing only 4 cells per tuple can cause the
> parser to misalign the tuples, treating the length as part of the iommu-base
> mask and stealing the next tuple's rid-base for the length. This completely
> breaks parsing of the IOMMU specifier and results in broken PCIe DMA
> translation.


Need to fix this in the next revision.
> 
> > +
> > +			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>,
> 
> [ ... ]
> 
> > @@ -3139,8 +3139,8 @@
> >  
> >  			operating-points-v2 = <&pcie1_opp_table>;
> >  
> > +			iommu-map = <0 &apps_smmu 0x1080 0x1>,
> > +				    <0x100 &apps_smmu 0x1081 0x1>;
> 
> [Severity: High]
> Is this iommu-map array similarly missing a mask cell for the SMMU
> specifier?
> 
> As with the pcie0 node above, providing 4 cells per tuple when 5 are
> expected can cause parsing issues that break the IOMMU specifier.
>

Need to fix this in the next revision.

> > +
> > +			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH>,
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com?part=3

-- 
-Mukesh Ojha
