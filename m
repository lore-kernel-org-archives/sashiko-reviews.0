Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E28E2EAD1C
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 20:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863067; cv=none; b=dLgRczCicIn9vGBeNLwemVsM1X0D8j+AoskhdKjFtDbcJT0Q0ZxjJV6cu7PQ+GgzmrJnir/jUv4dIbVe7XDoU6aAV90fWt2QE3KxBKjt48WLMexjA5e8rvLa8AjqbumVyIOToSKuVXWAZc6dY2zwyLTda36c9mLZMr7WMsXqmNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863067; c=relaxed/simple;
	bh=UR2bcIZ9fNj1oDZPGcdtMwxjyHrfZW8APyEZsxwXSV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zq/SmPmEmb4p5pnBHxzioVufVq49hgP17lMKC1SvDrUneRkCf2tb84Hp5uR9F7R6FHib2Oc+moUzc3LHJXAq+d7EeQCvhDWds0+xp2jw/ou9HW4V+6z0f5yxLdYtG9NRwJtlSnV9fGl0jsGrA53CJ0oSLT/XFUd/fmStXgE7UUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZA/I6gE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkMwBadd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZA/I6gE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkMwBadd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElCMK866323
	for <sashiko-reviews@lists.linux.dev>; Sun, 7 Jun 2026 20:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VH3iAh7MAS/nClNrEAXyxrKo
	p1YZ+KC9P64fMnhqna0=; b=ZA/I6gE7l2ZhU6d7hOxQGW+0oB0wTZbJa18oFUd8
	HAMzmuntecG3U3vlojwntYoYsOkCq+aVy1NjshfPgXNVaD2i9VG3pxReQVq/+wKP
	Uo4zfNCExC9nOBkeaslcGN/V87mt8Nz7lOGfI0ldZCaSt0GIyyMDYw7Je5v0qTjj
	0X34LfqHZndK2Wyjjuq2rpK/Zdp3t+pNdM6NTCb0lLALnw8TNcHgImLBhj2k4emf
	KJO202/MDxPCVDaVqMYkvj5LBITFUG6GYYCSryx0uxP90m/YgDDdJbCPl8F12Git
	28npDIAf/TDZL+5KA+5JHxtirWpUXB4xRK433OSjJ7hVCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4rqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 20:11:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517582695d7so87378921cf.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 13:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780863065; x=1781467865; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VH3iAh7MAS/nClNrEAXyxrKop1YZ+KC9P64fMnhqna0=;
        b=EkMwBaddrbfGzN3vFhIYcbW76CvR0LJf9jIAfmovrkVqiTgpJGxMdPHHBDhtfjpqX6
         SHf5gniIgycyqQD1P7GoUrcjri9QkuZOEx/ccRj1q/FQ6xGD/s+JyUt06gSqlT2qIBkc
         Eidaraw+B10/1t7sJFOdO7QRvzYv5Hc80a37320EvmcheJZu6MhyKUMQ1OArQ1fBSC5+
         X/PqAdXZElspO7V+3o9TK5Nek98ROb8rvGqC3dRKISO56woZi7CpoPtDbhsm0pVV1vU1
         srgJuoLd9/u6HRfo14j2Y0cuk88IdC26JoSoAfiHxRlEpbB0jpwWReVPf61XzrEU2jvu
         W+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863065; x=1781467865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH3iAh7MAS/nClNrEAXyxrKop1YZ+KC9P64fMnhqna0=;
        b=UzDdJ3PldgQdV3tzCjZkkqfBAa3SO5S2/cNHVpzJqvW066VM67oF8tvXNkz7m6eOcC
         4Yra4CwFOpNBrIC2ry9R0rD1iwTIFuPsUF+8HQ8IFbRZq50Fg93VIleffp0RPuukygmP
         ibSbRNY00gAGJ6/WYgqVzC/+1EZFCr0I3tlKRCpx2wlZDmDIbu3gkBIx+wcWudZZJEf9
         e1WU3MsM7JKFR+3ZZ6t+UOILiTXacA2HUWiLiOnSd/S1+hJ18a0hL6+xh54dZoHw3Cnl
         IRxcrhdik+wTII2+QrwIgs178B+OOrncgLrjW0Nh1PssX1mGIO/yuHBuecmEm7miANZN
         Hvwg==
X-Gm-Message-State: AOJu0Yx3QO7ii60uqL9ixuNmeMbrbt3GWW63son6azPLBD9ONPW/Qnnp
	1cjL3NWsz6rLRnKYQ3n+IBeQ+QXUpRYJl/XVFhwAKwGQ7zIOS9AGeouVyHwzu7QXlsXvjITyajK
	NHzsAJuUvDN/LaspFuoZdf0BEugI1rUteu9KNg7HGPi5adPy8mPJlJB4g/bqoCoIJJzNLQuk=
X-Gm-Gg: Acq92OHN6DrZAI20r9zrmBmQQjg0XLlTSHaz24j8wwkMQ64i7c22ACQchxtGEm41fA5
	EyWkV4UNXy2UbcoWyBQkTsr8eXLv24LRHVQaKrzmmKOqXw0Ab1b5U7CdTUBsYvXowLltpQZSRhF
	a7uTrsB5tC/v5ORRFokVm3fzMJdLESbxMhiQVd/eUpEGjiI7G81uV1rjEWKT/9BDqPXraLYwFNF
	qaStoR2jgFAXjV/bHEjXdQiabjZO4P3n4oeOclp/fE56+CQvLWRWELqfZEXhC/nQKYCaO1jE4kx
	+l3W8UwKmHysKx89Ft/LB0yZ2E0cpCTsuhyDT8BJfWCAA7ZpftFaYPoOjGsSJio31sW2SpFl+Mx
	1UsurvbMnQPQ2nj5OP3lFYBRusjOeUiy/HxTLsQZCS/Ri7H0A0aBUwbHB8sj0xDMfO6jVmQPYeW
	P0Iu17BJn5Gxm79GCxax/OfPE8OTdCP6pFkhEmhwtcdHffZw==
X-Received: by 2002:ac8:7d47:0:b0:516:e0e7:6e42 with SMTP id d75a77b69052e-517986c5482mr139898661cf.13.1780863064932;
        Sun, 07 Jun 2026 13:11:04 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:516:e0e7:6e42 with SMTP id d75a77b69052e-517986c5482mr139898361cf.13.1780863064555;
        Sun, 07 Jun 2026 13:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm41825351fa.28.2026.06.07.13.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:11:01 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:10:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
        robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
Message-ID: <y23cvj7jmfdysybgw7lobud6mlgacvr62iagqimn46i4adsdbq@xkeh6z4qvktz>
References: <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
 <20260602164512.9F1CC1F00893@smtp.kernel.org>
 <35f1ff50-74f5-412f-a52b-9906fda0edb7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35f1ff50-74f5-412f-a52b-9906fda0edb7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HL7cUVIVMg9qS_FgUbdEeQaDSkgbbL10
X-Proofpoint-GUID: HL7cUVIVMg9qS_FgUbdEeQaDSkgbbL10
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25d059 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=-9TPMfOEyAajJc7o744A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMiBTYWx0ZWRfX4a3NJW14baBo
 qKaF+kryL2OeVnla3FonEdodTTqaHH7bQPdFlW+I6/YtKvxVuesvgXJQl8/0fmXKWTl34hRHSeI
 GoD/W4MDJaqFEmF+EZuem8g2FlchmaALAUgq8EKFas1bK+cLEr+jIXFomKBFA5r4POsSNyTFzYI
 F+fSZcJCqPYtvPGcxY1zEYT7aUVGQGBNDbcm2uGzetFtY2b8c5VVXQtN6/tM1NTblrlWpGAr6Ar
 BZSa7mdtO2/erOTn4gjvwetr07lCgBgOhkvFHuSZc3zYaLPUOZ8IFBwoXb4ze1PTBRVS9Z9E6Fo
 rzwVubdwHqJY7i0fkUo+TamufcDzZVHEJiG9iDTd2ZLI6ijvIyOojmXBSKWPvx7nUcXER/IHVdv
 Rvbn5DHKe+QFDOjvg3XRqADIGXhezhBeEoTDIb0XSXs2NLRRQOBRwCmAawfWOObcZrQxQvd29D/
 ylOnL2DVuQBWwu/HpKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070202

On Thu, Jun 04, 2026 at 02:28:03PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/2/2026 10:15 PM, sashiko-bot@kernel.org wrote:
> > 
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> > > index 79ec77cfe5527..7fcf632e289f0 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> > > +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> > [ ... ]
> > 
> > > @@ -46,13 +43,15 @@ &pcie0_phy {
> > >   	status = "okay";
> > >   };
> > > +&pcie0_port0 {
> > > +	reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
> > > +	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
> > > +};
> > [Severity: High]
> > This is a pre-existing issue, but does moving these properties to the
> > Root Port node expose a PHY initialization leak on probe deferral?
> > 
> > When the driver processes the port via qcom_pcie_parse_port(), it calls
> > phy_init() and then immediately calls qcom_pcie_parse_perst(). If parsing
> > the PERST# GPIO (now added to the port node here) fails with -EPROBE_DEFER,
> > the function returns early:
> 
> EPROBE_DEFER will be returned when the GPIO device has not yet been
> registered, which I believe should not happen because the GPIO driver is
> enabled by default on the QCOM platforms.

It can still be disabled. Please send a fix, it's not worth keepin an
error in the code.


-- 
With best wishes
Dmitry
