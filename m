Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A63BD629
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894582; cv=none; b=qUX1uRfP3T1Ey1PqrIyeWIFkZOBWPUdxS543rWzJvu7hq6ny0mMsIRnBdw5yDPfjgsO5xGQ67ztIySzSswn5v6+L5aiXnpD0iog7w9OmuOoGzViQ3Ad4YU3N7MYppWCE+XsVKpe8ZAXiArLVqjo+CzDolxXZhkcv3JhGhYdyTI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894582; c=relaxed/simple;
	bh=xBT86zGvncxYuJOgwSvBQD6ugGny046lVMDOyZKRiVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGrWOB6qp2cDbx0IYNr4wgepoo2aG8IEBWmrMLH67WMpKEVIhwxA1+YL2/KftN4bXgRnRPIszqS+arZ/QsPUiT0OlHm4nRaHzg/ke+Ilwwm71AB1ek9olRBZQLyjCkmEuz6XcpKh8/EyGkkohmBPR48gxX3DE0NAVp7oJ1KuxsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZzygxqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhDAGPrr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZzygxqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhDAGPrr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618Fp8r495566
	for <sashiko-reviews@lists.linux.dev>; Wed, 1 Jul 2026 08:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7XZsN+xHgHJAq3PtY1yFAC8D12BW0pun+BLD8eUhwI=; b=pZzygxqY6hE+MJNd
	CuBOSeqsXfQdy607ME6FQI8bLy7mSEEBYxZc4MAKZYaCccGX3beWx0GiU64FyQ0P
	ZKDsu/uuRHPo5dVlWwjJbZVaQWpXlXjcKbXd5r5WmJEFx8Ysdnoiq7nUqGGRc0JX
	MAdm+HFUenhp8WLRGC5yRSeOjAFX2HYCT/BZI2hQWPeputKJzySuwNASw/19EYEZ
	AUYjVmH2qKm7wczvd3HruHlPWPomWKKeMzIJ3WSUJXrBno8FcSmNN7NxjbHoDcq4
	O67ZwkIcb9OEZHylQLRMj19qPB/LzRNCJbFPZ+yANS26h7J8prPcfeZLwnvHP1TJ
	zvAa9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99keck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 08:29:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84770f89b99so765516b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782894579; x=1783499379; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7XZsN+xHgHJAq3PtY1yFAC8D12BW0pun+BLD8eUhwI=;
        b=BhDAGPrroGV8DiFCEYvW8jujGPSiuVA6uZu3JfEWw1QsYnaYrgK90up8I1Nv4K3WTS
         Rfikq/7XqARkXeHWuI3V3aMyc8e/OmKHB5Bwx1d1FJK2kt7yBNbGFrFKy+ckjVcJkXMq
         CmLjXYYioHOQSlb2WeAQfxp0zuFXA+cthnyu78OQL1trkqLVEyCX6jkN8UFCcRfxb/rL
         9u8uWbl3o8jaXJfchod7/mVHeUgKUHjqB5406m/uCvghgx2mQJLDV4r6a92FXL3uDs+A
         gvSatfsDj9UPAQuP+tsANzqfCzMYmioRdu+ZMd4vXuDHuZ7Vb73GGa5PVR98Zv5OPr1w
         66DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894579; x=1783499379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7XZsN+xHgHJAq3PtY1yFAC8D12BW0pun+BLD8eUhwI=;
        b=cubvuCsH4Jq2iHbaoYmXDQtx6h6PMV3vyszpRwp+SRbet37pYDbCTxG5kFc6JS7jCV
         dBZssOj83ts6N3RBOB1+lKvkkDJKWLR5tLCnu/+JoXzO23iKfPZt0kEKNftSp0RhR96Y
         xx91G8crdqbbscuwe+zhshYl3CI/Qev/3/SPC+S6rxTdXuXH5wHqEusLS3rkJIf75pss
         Qt8QldRjh1Zw/9nkQFWS09C3rcpkvwtxhpvZU1NZKAgXMOuUcVEiasdMQo3MaXQ3evR+
         bC1WpHwbd3MElnaa15EniWKZOxu4x+6qVkb9lgSpQnDMTgyYjG5v4vun0lFW5UgIMEVY
         Jkqw==
X-Gm-Message-State: AOJu0YxFK+DZJvqfruHoyisyrSHaCRTqNpFgZrPiQ5nQReo9xpjPaL0x
	qT50ZbKp+KWtWjB+eWr2a2NWy7xAaeIjb5uGcb/E5eOI7klnbxRW9pQ8vICe4WwknQQxscY+yFs
	Sit5iQiU5TKItszxE8+EsAISvBsgGNUMU0K+xDic0wOT985kUAxO/IXEnZcLFEs4F2N+1g9j5vL
	eDv4Q=
X-Gm-Gg: AfdE7cms3mmRyDljiAzcYlp6YmAO8ODtasoV37Inm/+NoTT2ISQboR0eSMfJorZN4Rg
	dDHHH6u+cORHnMTnTjGM3VU2Sf/BckbGj4FdobsFZMx+k+Zlfeyl0IqbwJBDJA36ZgKzLbkpg1o
	ruOzDAfGlFkCLzshW0xZSo2yQbPegunFiLM1I24vOmpIT0ZgcZ+GsVtQ0Jf4FL9KNyvcoRACbPk
	HHggM+AqPGXnMEWNzCAuq6JDDASAf/goFnYDrewLuXdNBopQaXt+IaYwR/E0r36paxnEVhvEkNu
	GmJMSZcR78GR4BTluqpV0u2OfzpQTHku8m2xc28pButf4Aj4xyOkmRsOKMUZt+vkoW7on8tbd93
	Z8XuIS2xI11lOBr+f8jqgnjycydgRzHjJruwdqmqe4Ewgig==
X-Received: by 2002:a05:6a00:4c0d:b0:847:968c:a0f1 with SMTP id d2e1a72fcca58-847c08806bdmr634750b3a.43.1782894579221;
        Wed, 01 Jul 2026 01:29:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0d:b0:847:968c:a0f1 with SMTP id d2e1a72fcca58-847c08806bdmr634725b3a.43.1782894578723;
        Wed, 01 Jul 2026 01:29:38 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa4f0sm3602813b3a.19.2026.07.01.01.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:29:38 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:59:34 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
Message-ID: <akTP7jU94kwdFL/O@hu-mchunara-hyd.qualcomm.com>
References: <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
 <20260616131405.448371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616131405.448371F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4NiBTYWx0ZWRfX6PrcVB9t3VM6
 Icg/B2wJAGscdd1BD+aMvHbPjWji+QTn7D4brOjCIcK/hgMkp318evsHLwKCCycS5Pv/5oFQrRt
 9YSVxzMlcXHLKz4NQzabFIXeFK+HVic=
X-Proofpoint-ORIG-GUID: IxDXwcf4GPABk5G_pu41Nu2m5PH1AXH7
X-Proofpoint-GUID: IxDXwcf4GPABk5G_pu41Nu2m5PH1AXH7
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a44cff3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=DFnpr0ky8UtvjzgDlIUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4NiBTYWx0ZWRfX7qY3+zx++PoC
 q/LpdjI1/4RQrsLZYKUqEtvZovnblhx8zTKVd+kLpGAbL5IEZ6q/KTm9rF8HUPipjJL61Qf7JMf
 yuD+ZjNKbZ9N2zPqeXMNyRWNt5+67B0BLgqhKFIgWmXn+Y33PYuhHjbV6vttwN3pl0tNIBgJbbx
 D3j8io2VkAxrtq0aQCs5hscYJCuduDbR6NIlY4+dbEQNMrGFCv22PGW1BSYj1HY8MFzxCHPx6Lc
 s2VA2JZznnsvR/ED2dVMByWSx7KbPIRwKx7rhZ/oAp62eB2qBzrr14M6i8VQe5W4OT6qGYRhEAp
 52SxEcJuRRYL2LPq1scJM8q+thSh81EVTwzKAk2QjCHJteHQOiMZveaM3cJHR6pF1zTf0//X3Zr
 oq9Io6x8sgTfAq5k80wahnHY6yd8mrmntcpDZfJOOdVuujqP3v0QAMD0+kIbk5kRwmwtCBzsxbI
 +WyYodDsttuoz7kja6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010086

On Tue, Jun 16, 2026 at 01:14:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Incomplete genericization of `sdhc_1` leaves conflicting eMMC-specific properties in the SoC DT, breaking SD card compatibility.
> - [Medium] Removing the `supports-cqe` property from the SoC-level `monaco.dtsi` without explicitly adding it back to all eMMC-based boards causes a silent performance regression by disabling Command Queue Engine (CQE) support.
> --
> 
> commit 05fd7920ab031fea94cd493a589a30892353cf08
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> 
> This commit removes the supports-cqe property from the generic Monaco SoC
> device tree and moves it to the qcs8300-ride board device tree. The stated
> goal is to allow SD card compatibility in the base SoC definition, since the
> Command Queue Engine conflicts with SD card operation.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > index 7b1d57460f1e6..e5f316897706b 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > @@ -4828,7 +4828,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >  			qcom,dll-config = <0x000f64ee>;
> >  			qcom,ddr-config = <0x80040868>;
> >  			bus-width = <8>;
> > -			supports-cqe;
> 
> [Severity: Medium]
> Removing supports-cqe from the SoC DT without adding it back to all
> eMMC-based boards appears to cause a performance regression by disabling the
> Command Queue Engine for those boards.
> 
> For example, arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi and
> arch/arm64/boot/dts/qcom/monaco-evk.dts both configure sdhc_1 as an eMMC
> device (using no-sd and non-removable). Since they rely on the SoC DT for
> the supports-cqe property, won't omitting it from this patch silently degrade
> their performance?
> 

Update for monaco-monza-som in v3 series - https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

For monaco-evk, it is handled via the overlay monaco-evk-emmc.dtso added as part
of the same patchset.

> [Severity: High]
> The commit message states the goal is to ensure the SoC definition remains
> generic for SD card compatibility by removing supports-cqe. However, does
> leaving the other eMMC-specific properties in the SoC DT defeat this purpose?
> 
> Properties like bus-width = <8>, mmc-hs400-1_8v, mmc-hs400-enhanced-strobe,
> qcom,dll-config, and qcom,ddr-config remain in the base monaco.dtsi. Since
> device tree overlays do not automatically delete base boolean properties or
> override tuning parameters unless explicitly redefined, won't these
> incorrectly inherit to SD card configurations and cause the MMC core to
> misconfigure the interface?
> 
> Should these properties be moved to the eMMC-specific board files as well?
> 

These speed modes are handled in the eMMC driver and won't affect the SD card
functionality. bus-width is overridden in the platform file to match the SD card
requirements.

> >  			dma-coherent;
> >  
> >  			mmc-ddr-1_8v;
> > diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > index e9a8553a8d821..3090eba0317ac 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > @@ -719,6 +719,7 @@ &sdhc_1 {
> >  	vmmc-supply = <&vreg_l8a>;
> >  	vqmmc-supply = <&vreg_s4a>;
> >  
> > +	supports-cqe;
> >  	non-removable;
> >  	no-sd;
> >  	no-sdio;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com?part=1
