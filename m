Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE41C2D3A7C
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877765; cv=none; b=PpIqlu6eZkGFAm16LszbgMR7RJ//8BS7VPLth+Rinwv/hF0BF4V1apy0m8ClobpjX8ht8RboToZlM6S6MdDDpDU5Kqi9/YhhDknMw3xGEjwWnTH31w+gqCNY4eVrGhxJ3E0REhzvnu/Mq9j2oN8+eXGoqq/4vKgOomo0iM4eJlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877765; c=relaxed/simple;
	bh=UQQnIXob+/s9OIPRi5J6ofr2XzDcFk5vQvTsKvxzwto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xk7XWh2mrlUN8yyFdX3DpsRuswbhUP1a+Uc7Q4rXiuGPuTb90KdBaVTQR92zE8m6o3fawPfdC0pvLxY2574dCeWJZXKJYAjBGwzo0Zg9SrMhldHcS1HsvRTb1ph5TLquZs0s4rsI2Nk5dni+pmsL7hPb0+/pMKf2jSUehLmSXog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kghG/e5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGn75ZCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kghG/e5S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGn75ZCy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lXbe2125263
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bRAFAPrhzs0JZ7CR2lh8wcue
	7nCkmX7RC3NoU8zQrJQ=; b=kghG/e5SU4AD9C2HfL4jDQv7v/9tIEbNjAppzd0U
	tbp1Q2ylthfiqQldkbKbo5kdDkG28GbQeiqZfUgzZFVvUAhBqU3dP1feYiYmGK5R
	9Q1MerJG0ruxgB8OH2ac3WQZ+i/TFgfxa/pQ45CYTKlmnkJfAZVc7yp6ATCILTgZ
	Vy7DmVAmci1KVGENtI3k009d5XyTjPfv9/zGh88DzUqhBzdO3i4G7oA9a4n+EXSF
	RKak++w7LAJScMWOnOuntPJpfhtvbtZQq9k59PFY8UArxoKMLc3yiCF1Xw49nAUQ
	bR/hru0m6tVBrunhT99tIEnXTiDtHUMDFeBbU+CPETgpIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamtjqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:22:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso2527631cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877762; x=1785482562; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRAFAPrhzs0JZ7CR2lh8wcue7nCkmX7RC3NoU8zQrJQ=;
        b=KGn75ZCyPcnofGmst+dRjFGZQNso+wkJnR3lgqINOU4aXNgWZ+CUJ7WYUVFV6rOgSF
         6vo6sb9Rffv98Gm45dhrBAvJDLDOzQjZ5GDtAci4i4XPp2isJiq8esYCiMEILWBU4Vvr
         v3puY5x0RSdn6eM4VCXMikG3X90jjpGFifxsp9Myk40noLs3+1ELl8G5kVCFR46ieYIZ
         LHyAFD6Cx5WCxKBKgRu2li8TOdjZqpyIL/JtnZ+TyO8stnoaX5psL2VoNcZa1veZdhuq
         yznW6ARqexlhLOC1jutfFCkuQCRzjqIfxu2WtW5mtioa3M9t+xCowauz/pTy/rXeusnP
         z/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877762; x=1785482562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRAFAPrhzs0JZ7CR2lh8wcue7nCkmX7RC3NoU8zQrJQ=;
        b=tNXVaTfFXElpumWoAukMADg1+H5yUwoZ6/ys6kPTm22xiM0ZJ0G3AVsalVteX5Lcv8
         lx7COn59ViYI6SDJu7ObcuzfozNwEQD78rpzx6vah2yvZnXgHf9S13HcFzh9L45lXAbK
         Jtt4ZI7LHBZEsF2fqHrI0kctu+AJLnuIkY7eeEWUMfCoJlDa4AzzPCsaWsLwXkOcBC6H
         96prluNn5dfX5uAXCd1lxbmcyENtIttqV+DvDhWkMBuub6x+d6ZWVIrYAnN5urLbt+dQ
         RByKmycc1PfN80WUoRJNF8nFFTwnCFyEQ57zxL9K1u4ETwNm3nvbK37V1ERh2T5dT3Jo
         qHWA==
X-Gm-Message-State: AOJu0Yw75jlBilel+ikZh/snlMLaM5BWE9plbM8pqJw40zv4upAayds+
	SAxVlPtDxzNElsp40+bCDGegffZ8WcBJDu/usnO7CWF1ee3TKoTxySv0LxbeVfD1k+pF/6QyYGD
	18BnTGj7W9mHDdd8jFJr2uaUNpY/LQUlq1dz+O6QgyY2Ajfpqq44gVhr4gLpSwe3mb2jms9MfXq
	aotkI=
X-Gm-Gg: AR+sD12LxihBTkbFGawpjU5tHYelL0O/ZywFJLuHT3UTkGt5S0gwucDeTqjdRpGWCrt
	IKj5IwzuOF8sXBBNz3vqtHVj5FcWicEmFvU84cA9zZTCshtXscRLIVRex9CtdP7ikC9+speGNwS
	Xb3celEu5pNulAcIwm+ScEzg+VGfTpAljEKAenf1cSyb+m883+0/WGxJ0Q3AEYfSrTI0o0UeGjl
	GB0OVbWlqNpcbgIdBUQgr4+QLQO/p7W+OVaKWgsFU0fpUusesZ7D6wR2+MsHHrTBsN77lImw1iC
	fpxWYpNKxU4s1drgdfQmJL8KTo3bVMkxyphFNHxPD5kqy5F3sN8QQO5n856eJYovOe/lHBp0mqB
	frxhIWK5tPKnt3S8=
X-Received: by 2002:a05:622a:30a:b0:51c:d1c:474d with SMTP id d75a77b69052e-5283de1aa43mr55597801cf.19.1784877761942;
        Fri, 24 Jul 2026 00:22:41 -0700 (PDT)
X-Received: by 2002:a05:622a:30a:b0:51c:d1c:474d with SMTP id d75a77b69052e-5283de1aa43mr55597721cf.19.1784877761413;
        Fri, 24 Jul 2026 00:22:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d4e4sm55457655e9.2.2026.07.24.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:22:40 -0700 (PDT)
Date: Fri, 24 Jul 2026 10:22:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Message-ID: <7bwizu72b46456esrly4um7y3hbda4cxmmvfjvqbqjtsaynmqo@ps5e5mcevarh>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
 <20260723-dts-qcom-eliza-add-cdsp-v3-1-b535200996ed@oss.qualcomm.com>
 <20260723125953.8F87F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723125953.8F87F1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX/rsaMPtUCOQp
 r0kXobHGO49z9OOOU19fEQZudpnDCDQZLie5m8q0Ii7tuoIaaPfLCQvkMrvb89VWz7FCxtWv6qw
 kaW/UF9V++1gV+RzniPZCvO1meclvjcJyAXKApxUtt6wvBS6SYHaF4Zb5y+9XbWaPtkf183O4EA
 a/n2WzZy1WibW/HIEf+UK2uuk08vbKMWlALEzZ9P/bgqGcPiGQdVw8fdhPV4/RQ91JAgNebk/nH
 Ks8Z4nY6CxrJn/dPSIBKHrbPQijsy9U1uZElPHwhIthRom/7p4Rz94h4UrA1B4V+GpzgwnVN4ap
 0MIynrepdKPtAQz18ZGxP/MSQPQwp/9fBKCnQ7qG+TrjgE8naEKXbD6R53/MqsJ1xN2A1TrcMMC
 GABBRsf1+JyY1Bt+q2txyx9vzB6hshDR5LukUu/9G0n+Jcfr0klOh/32YO4o84cKW/i56DjzpqI
 F4EUpc+q+UYOytnyJ2A==
X-Proofpoint-GUID: yMePB97xZYHJ73QbS17V9VK2OabSbeON
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a6312c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=57vlxwFmncND1kVs3ZwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX56O1EOkiZwN5
 Bj5/WuBYsVbCl6zldlyBsAD/fZa8LdKadkfzelc6Qrfcz8vgZ2PoFjfEnES5DLnB3Fa4BmvGjUy
 f7TRcKrOyoUFEGJrWpoSIXYuqEhKqPk=
X-Proofpoint-ORIG-GUID: yMePB97xZYHJ73QbS17V9VK2OabSbeON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240065

On 26-07-23 12:59:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The devicetree node adds an undocumented and unmatched compatible string without a fallback.
> --
> 
> --- Patch [1]: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP remoteproc ---
> commit 5421ef4d61bf1a4a8c2f57dab436568cc9538d95
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Describe the CDSP remoteproc
> 
> This commit describes the CDSP remoteproc node along with the glink-edge
> subnode and the related SMP2P.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> > index 357e8066c1768..e38a1d94fbe23 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> [ ... ]
> > @@ -3737,6 +3761,57 @@ nsp_noc: interconnect@320c0000 {
> >  			qcom,bcm-voters = <&apps_bcm_voter>;
> >  			#interconnect-cells = <2>;
> >  		};
> > +
> > +		remoteproc_cdsp: remoteproc@32300000 {
> > +			compatible = "qcom,eliza-cdsp-pas";
> 
> [Severity: Low]
> Will this compatible string trigger a dtbs_check warning because it is
> currently missing from the device tree bindings schema?
> 
> Since there is no generic fallback provided (such as "qcom,sm8550-cdsp-pas"
> or similar), it appears the remoteproc driver will fail to probe because the
> string is not yet matched in drivers/remoteproc/qcom_q6v5_pas.c. 
> 
> Should a fallback compatible string be included, or bindings and driver
> support added alongside this change?

Binding of this compatible is documented by a separate patchset,
mentioned in the cover.

No fallback fits this CDSP.
