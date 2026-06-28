Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A9234404F
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651090; cv=none; b=A5onkq9n/+EkR56rxVQHoNiGwK1eXGLKZ2YbBVt0DQiok0dh/RVquyDOKHFRPlZCfmo5mutzpteqLfY2t/bG54zr9r5p53Q+GhZo5ZpTjWnHYg2qrqMKhKLOdU8dta72McZw7nUAPOMJ+6flVIIytaQNLH+C/aHXZtigbHkii60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651090; c=relaxed/simple;
	bh=RDSYHfnxcOWds9DWCjFzNdwK3p9oDntSlN05/iqC6sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WayWTqTXqY+7nPmD9avuiqqAuMXXwJ1qNgjaMWGbTlAmUo3fN3N2/4uk424CZbQb66xCxxuqUjYH5xI68CsRjlZ1EEqYSB650zHCBV4QgMPYltgRK6unCJahVAGpcmv4vVXuItYIzq5KjUrXtj+J4+Z6G2uBpz52pBRHS15i2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kN+iuZAw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRkpvIDd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kN+iuZAw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRkpvIDd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P3DB3633101
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ehENsRl0qPpAQgK5q0nAXXAN
	4wFst+lTFJbIeKL/+yk=; b=kN+iuZAwZ7aHzx+m5UJxv+UeDzOzlC34TL46iJff
	ehA5cDaMvE2itl4tn+ePtCGugU9YXEJZRgkb1wzGZyb/rL5dQRsK0Pcu+rMd0r7s
	eMp7ZDjvjc+IX5TZb1ttDdRv4t/5DAZXJklEs3Hmck0qwTXO+yjqCDb5/2QKkzVD
	t3hei8gAhudjYDG8XaRfbTG3QQv3WjFZimxlykO5UteEjsWeRuzCI5oUQ268X5dn
	Jivlb6xHFVVqze0Nj1AdhopkY5Y8HD6Bpe4WFbXKJ80E/qnVdzXgTS/W08V2mU6+
	W93NylTZC3B5/VxbB9btEnuu4qqL4G/H6vXMbl6myUrIag==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tutw8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:51:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8db8b467f13so57961026d6.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782651087; x=1783255887; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehENsRl0qPpAQgK5q0nAXXAN4wFst+lTFJbIeKL/+yk=;
        b=PRkpvIDdkkyZoVjxixI1OIsVXImRNKmUZjOCOkZHPomZmbav6x40mXtqyyJI1bxW0/
         SUCFWd4tfPlxdftGZvn2+yMd+NxkPrXQT8I0KXkEjoM7uMRm++tz0WHPOxmU4hMYB4bo
         3r9wuJUKRYkvQq+Vo89frJt/mmoy6kWR79e/OPjk8oY8AgfXuo7C3wXvzjiAoAz4rQLw
         LK0CbiPT5ev/EiBZ9FBleXaDY8Nasqlqma+du6g5DhYi/Tht/A1tba5Y17ojbyDUvGlv
         y6JACAa4IieX0TUIAG1Qjhqsskv++UYRVqizOcXPm0ebUkpqe26i2YKldQCPOtmAjMjY
         TVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782651087; x=1783255887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehENsRl0qPpAQgK5q0nAXXAN4wFst+lTFJbIeKL/+yk=;
        b=Dc+NDvuYY8r8cvs9A4dIXtfSLecM9L9EMO38ikb6Ww9enqsW2jHLTlZd1iK4Zl2Gsd
         PIhbEAslS0kw/Q67Es6d3OlLbKczJaw7rMdQDB8cENcOlZ0ggq3wv+krRIiwl5X2owKF
         9MhhE9WU3mqq4ySlqjdpcBVysREsULlc0vI9bDi+ol3cfC8Va9KOO5Z+K8ppFraa1qcy
         vZ3PbL6DNcHiEsNLKTEENn97pFOUH6xpBgCCljxr/nUAks3K7PCczoUsfrpy3HAb+VK+
         aa9ZO6mdPbC4WQ0MFsyxOqU6Kt/76SWgWCq6lkyr+uY94i4m9Ft/5CG57sCPjkzfgcyM
         BQ3Q==
X-Gm-Message-State: AOJu0Yw56ZOjQuJvzKU8SKILKkR0EfHy4434Z1KRXrPjapKeXR17+b6/
	Y7foGSHOIylUWEwzLCRy1TQ0OdxckfA+TshskZWAE/W5NbT8JUKindbKB/ZDVxJlrPr1QOP1Rnr
	kjrVFwAruwC34VVWaQLmM7sPIgmkspb/uNP5zuecwVXmMJofdszuETtxRPMDiUMNgj8unazJvMZ
	JL584=
X-Gm-Gg: AfdE7cnZ13TIipEjHlwJMByPz38TefIg3OvVI2eD4ZB3wpI947Q5rVmdoNhShXXfGy5
	zPQS8qVRE+4JOKOvpSgqI+MApzRahwsAVaN9kWoCDrPaxlhPSNuPKDaFBfYjK+g/v0El6FbPoTh
	k6CrJ2qytnY6ev07gTRfxdxaX/a++DvRWpi9CY+uOFCxvl8k/uY1ewhgFIXqUX7CUUIdk2WzQQ9
	7mfPgtik1qw3CNhlEhM+0CrUq/UMEkSFFCKw4y1cMDgwirz82Gxq1giMFfCXnC6Bk0YDCq59w9C
	TmrGMLJXbmzcAn3OAOYD7D/xgAhPcJeQi8TX2yr0674RkqiBDhbMOryacgqH1YR1oPExkPDWukd
	VvPWfmTYLb3qSfaTs9vl2GIuZV6dXFoJ7DRREcVDoSmnd4YrboXCsf23HNRA+mPWRyMGf+BiCre
	g1vDwJcHuj+y1CXDhwGZfzNn/0
X-Received: by 2002:a05:620a:4451:b0:915:b852:4361 with SMTP id af79cd13be357-9293bf25c13mr2064033585a.20.1782651087262;
        Sun, 28 Jun 2026 05:51:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:915:b852:4361 with SMTP id af79cd13be357-9293bf25c13mr2064031585a.20.1782651086833;
        Sun, 28 Jun 2026 05:51:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad31a81adsm26842481fa.28.2026.06.28.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:51:25 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:51:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Konstantin Shabanov <mail@etehtsea.me>, robh@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
Message-ID: <fcpwtgtyfab72iwkouvybul6o5cwswqxxj6vud6giljpqzlpp3@oyvcbx5227dm>
References: <20260628094031.54452-1-mail@etehtsea.me>
 <20260628094031.54452-4-mail@etehtsea.me>
 <20260628095420.4A7751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628095420.4A7751F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMiBTYWx0ZWRfX67cyMll3KzHo
 foiM76mQKykKt3HRavLD5vVW/KQjIVmv/+jRP86EB0kEhyHH03IiQd6hG9DmOWX3L19Qb9iNS1o
 z/k3KD8aWXejnYRYl+K1AHq6KrXC4a4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMiBTYWx0ZWRfX1WOb8Nr2KdAF
 xh+cdKhDrUxa0WDuHjyuQnsSe/7rejU/rGD4SRGKRgOFej3RVXkAbSkFRYikCbWgaXIeIKbPPSA
 7F60Nq4Dn9SYm4hsIpz8V3oICw9shGDqR6nfqdiO4WgsAW7nw3C7A4ojSI3mD+c1p8xSnHQ77W2
 Ixvq4wuiTZIdFq5tYIBmVNuKg4ymcnBeguBvyySiUDx4qp/n8WXjWvAtWKLRw+hKai0zWdhuA/R
 1fBVcR3xBPY6LPQ8xnUaOGBLvXs/lTuCuML2DPdEiHBM/WqEqOezaSvrWPKLoAkTsIoyQw1PizK
 1NBaO/R+daND4BilfxuIWvvgE1Vli7idDDlo/x0kr40Djt0EbLlpsDfdyZz/SxtcCa/hiBAZKev
 +gdzgMjYJpE0biMocqk6gUtHRDQPKmA4zxi7pIQwxLuLbXM4xg5ORWuXkKnJSo5lV4arNRXRlKB
 vt3Ck/xYSypsNvypRyA==
X-Proofpoint-GUID: 1BQAMYoPtnLrHmqTvvaK8MdE_xodQLnG
X-Proofpoint-ORIG-GUID: 1BQAMYoPtnLrHmqTvvaK8MdE_xodQLnG
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a4118cf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=WHjzPRnL89bxSTNla3wA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280112

On Sun, Jun 28, 2026 at 09:54:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Mismatch between touchpad interrupt GPIO and its pinctrl configuration.
> - [Medium] Type-C SBU (Sideband Use) routing is omitted from the USB-C connectors in `pmic-glink`, breaking the DisplayPort Alt Mode AUX channel.

This is fine, assuming that DP is rewrired...

> - [Medium] QMP DisplayPort PHY is directly connected to `hdmi-connector` without an intervening DP-to-HDMI bridge node.

... and it is. But here Sahiko is right. There should be some kind of
bridge device on your laptop. Could you please check and describe it?
It might be driven by the simple-bridge Linux driver, it can need no
control, but it should be present in DT.

> - [Medium] Both WooferRight and TweeterRight are routed to the same 'WSA2 WSA_SPK2 OUT' source widget.
> - [Medium] The touchscreen reset pin (gpio48) is configured in pinctrl but never driven to an active output state.
> --
> 

-- 
With best wishes
Dmitry
