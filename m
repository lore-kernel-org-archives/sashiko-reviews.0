Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F60338657D
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812279; cv=none; b=PTtvqsa6D5ldVJIusEq4/qPNldTzE/XAyi2wu1rC6RakZlKcQTUkm0JiwdMQVuDetYFOMpeEuMuh6gEG7t5CLlkFYLDAAsC5LefuH+mSFZwM1foCMUTbs08mAo3PDkp468zH6xhtSk8rH/PqAaDym51VcA/51xRuJduKLlbKLzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812279; c=relaxed/simple;
	bh=HOI0xlAGYy7l5QgfD46kgY9CHumk4KFjvm+/+5OcIyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oq6HRr+jVLsB8NYaTPjHMscSuqJ8gNYLsMnwPxmcR3hMVNKzxNN2P9hcinGDxIVeEcCqBuGpztCgTQGMhXrmo0I6AmVgZRLEzvhUkuiG04VM7OsprVql+h5jQDu0NzmPQeRYXyKC4OoIQks45F6UTEZNsvb5Niaa8gHgM91fKhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+Gf0iuU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNMOJsFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+Gf0iuU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNMOJsFU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CM761096406
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 09:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsS4SrOC/St+FjQR2wWV5f9LyPOGuDEpJPbxdHbxdEU=; b=G+Gf0iuUl+YM7JIR
	cEzl2rOirYJX9ImhOf62a0uwEKgZVdgjMyRc4vszYOZKnfDYbPe7BrFcfjuV9rpq
	JZl41+GQOD9bcQBHeKEryHBRydPY9cUnG9nNJKAUNgreHCmhgbgbj4fYkrCT0czH
	8S4v9n2bnR1Jf1Gco5Ld3dWMA9MD9g9u1i45PrgtdPQzelZm2gAesQ1ZLjmBWSmP
	eI6lNeFjlvSlO8hd0qC3XPF6iHf+fXB8T+3yeYy19RlLdbuJkFfDT9nKe3Cky//3
	J5rcUbcSI8E7jqhD3iG28MTiSUIL1e5sOxUTBmuZcWscDOWzgga7ffuiU32N1eKg
	3ZZAPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gsv5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 09:37:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915f6ff639aso1145691685a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782812276; x=1783417076; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsS4SrOC/St+FjQR2wWV5f9LyPOGuDEpJPbxdHbxdEU=;
        b=VNMOJsFUi5/8tDNTEplGc+NZLzX210kLjmmPaCpETvYXGEcWDloLeTlE/K2MziJ5rg
         0vXaKknSaYMcJCXYYUC86kDxcVZ/rvY8edl3uGzZnPtyEJDGhISkSG/cGNvdf8IZRBnU
         SVyHH7TlIeqK+n7WLDQOoZoLk2wxEZEfH77FH1v/Pa0YIVUOpWnD3jllMQLKnwSE/W4/
         oy/6oxA4mbiVOVS0dL7B4FigWNbkb1pn9JE+MvpLEDYu8RUze9m1+QkKvcINnI0UUspN
         Pz4BV/QIHS72K+0LEgM1c/FZ2Se3qH0Z7hD1RL5H1NcKdGJMMNkovOfdxSRFLr44qolK
         E/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812276; x=1783417076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsS4SrOC/St+FjQR2wWV5f9LyPOGuDEpJPbxdHbxdEU=;
        b=ThIejVlLkFl3ixb+DUGXnTsI63vYDJSPVULPrklTT42FMwZII31WnKj/ptDuMPbxP3
         8i89NNK2eCffPynyVFzZZpHO1VKUtd37tniw3wEqImCshf9Va2kMr04L5r/Sc3S4kvMO
         pXANl36lGIQSjKXXnw6j0Xro2jAFLhwb32zWHuId/whHtZLERTpCrZfqN5Gsnputelh7
         FFKWgDyQ7AWspw0bhI97g2tJTiXKpjNnWbbfcdxYn10n46W0mj4A9B23VN/PoAp3P+T7
         CeWoUiPpjGo74RYx9xGaApj01lBpbcF2+bQGqr4b1OQGQHSmnL3Ei6raMqhNvhXwpYjd
         f9wQ==
X-Gm-Message-State: AOJu0Yzs+82zvRGN7EvAfwlGoxcHoNe95AODsuSCfVQnzHktpcz6iVv6
	8ULFa0RnbzWXbxM6W4GenlKW3l5MzaO0tmdzrozsyREIugvZgPzB7AXYS+ndA9PlQbeBdnwPv+F
	qvUYgYTnyr8WQPNWYvCwrMtnytlwFNAxU7UWqHnvfui4fDdxXPMys629+vjLRPsIwTQJ4dT9Btw
	aPVbM=
X-Gm-Gg: AfdE7cmKBSY0lDeBqkIC4gMQjbqZ9iDoICBN9+3odb+SXM5pHUXiObyClP9wfPmOsqg
	ximXon7g7gaxqNAKFmBZ4rPuYhubA9duQyFYW+T2KltGgE/6tciUym3GrYq2+vwrNGm1pkxUez4
	1H/ItZq4kS62pm/3S9Hzf5vcjoxFmomAcOgAXOVZTfGoKN26kqjk7GBaEnAS6xOswvh7wS+VjDi
	8l0jB483X2FVqmFtjk00nWOTbDvWY29yHowri1pFqjsXNPU7osZC1dKmK21StItkFBLGgPAEFRQ
	JM/x/yMnhqrIWDK3vSvFAEZJ++LYI0JSMj/gRVsBy7OQFFrWU5oBCdLlWvyVH24lQ9jKBBP74xB
	KyUWOcXGtP22jIO/YoKVS4zcleAv7lmi1DnpYkuTeY3wxKvHRJHy3J0m50gIs3Dhht0eGPb4E1Q
	==
X-Received: by 2002:a05:620a:4412:b0:92b:a326:3bdc with SMTP id af79cd13be357-92e624ccfadmr452299685a.20.1782812275655;
        Tue, 30 Jun 2026 02:37:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:92b:a326:3bdc with SMTP id af79cd13be357-92e624ccfadmr452297585a.20.1782812275232;
        Tue, 30 Jun 2026 02:37:55 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e622e7fe3sm199003685a.27.2026.06.30.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:37:54 -0700 (PDT)
Date: Tue, 30 Jun 2026 17:37:49 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Message-ID: <akOObU-nX0cDEhrd@YUANJIEY2.ap.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
 <20260630072606.E55491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630072606.E55491F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4NSBTYWx0ZWRfX4n+Nl8aslx2f
 a9XY9k4uQyoZSA4BZNh/DYuVfmwMxFny/z9LE9ttSO3ApBgIELF2DkRm+WUbgKBoB5Q6NTi/vyD
 u57PWNRq5YtYROC+ZqZiw3MQogZPIgg=
X-Proofpoint-ORIG-GUID: 2R8y0GfOy8_tYxreh-NqBmfkM0jQ94mz
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a438e74 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=8wtVhhPeGe0wYdhAELwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4NSBTYWx0ZWRfXx7oihHAsdHfv
 pRGKeu47HYMXQb67NWN+Ui6jgUjBJjD2AKr7M5h2xfiyKs/fvMdK8ZuLDU9gpkkwr6LAOH12ElF
 OexEO24QbLwwWDCoV9hnvmC4nml10Z0vywlgKpdURaP2AZZJR+s+IRmAuuSY7p6+n9UdTlzlHaH
 QlMbAE/mShlTwqnFgnydSW9VvOjvSxRXpoh0M3dacN45ENYUG+wndSR33NeIQRjlppFw7RqVL3Z
 hASPB39ZmR/mx0eQoN7inFfjRrMtCu4Iqe2d4zEFshWQvkwIo26t5AdS469dm9LOq8Nf5FateXm
 y6IKj8IavTtleZid+RtbBB/gOWkjnEmb2xeKRb+oqSuu+oGoY9Gacd/9SJWRXPtu/HCoHQGMBcs
 xAqnTCH8qsu9rnMrUwbEbYUCZceBbTZXbqRhi6mk4fIuzQ+1ZTnoTzxsSF9IOZNGRPXdT05cSd0
 VWqgkmhCf7sjEMZcW/g==
X-Proofpoint-GUID: 2R8y0GfOy8_tYxreh-NqBmfkM0jQ94mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300085

On Tue, Jun 30, 2026 at 07:26:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unused PCIe controllers (pcie4, pcie5, pcie6a) are left enabled in the ComE carrier board, causing boot delays and power waste.
> --
> 
> commit 5654913fbfd858b8d2bf4684318b0d7145c8a5b6
> Author: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add base HAMOA-IOT-COME board
> 
> This commit adds the device tree for the HAMOA-IOT-COME platform, which
> consists of a SoM mounted on a carrier board. It includes initial support
> for components like UART, Regulators, USB, PCIe, Pinctrl, and UFS.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
> > new file mode 100644
> > index 0000000000000..99c47cd953b83
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
> [ ... ]
> > +&pcie3_port0 {
> > +	vpcie12v-supply = <&vreg_pcie_12v>;
> > +	vpcie3v3-supply = <&vreg_pcie_3v3>;
> > +	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
> > +
> > +	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> > +};
> 
> [Severity: Medium]
> The included hamoa-iot-som.dtsi enables pcie4, pcie5, and pcie6a with
> status = "okay", but this carrier board does not disable them or provide
> the required reset-gpios routing.
> 
> Will this result in the pcie-qcom driver powering on their PHYs and timing
> out during link training?
> 
> It appears dw_pcie_wait_for_link() will loop and time out after 900ms per
> controller without a connected device or toggled reset signal. This causes
> boot delays of nearly 2.7 seconds and leaves unused PHYs powered on.
> 
> Should these unused controllers be explicitly disabled here with
> status = "disabled"?

Yes, Hamoa COMe does not include NVMe, Bluetooth, or Wi‑Fi,
So I think PCIe 4.0, 5.0, and 6.0 are not required. try to explicitly disabled in
DT is a way
 
Thanks,
Yuanjie


> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com?part=2
