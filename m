Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67D3A168F
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650011; cv=none; b=VgW7bTosZE0k9iXp9TaBgR//YwkyqwCDX/OdovuWRHefCDrjobOj0vAtTkatCXM5aNYVryCZUirt8E2tcrPAcCqD0Z8N7gQlB++1CmDL8ai55QWdBc9uAVF1UdxzxY55nHNvlcRjo5NVvSM9p6u3vfkbqGoUbbahUJZZZjAXSt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650011; c=relaxed/simple;
	bh=mykbP1tmhDjVBsB+bhm2oNPjCzqiU+fEZXgkJTccrvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srG1rpxXRWmrn94DPZL9P1ERW9PpAhQNoq3Oxn0lOP+bI7v9MigF53UPfoM4BdJrYd4FuXCysi/3+mBSoHjv0T1NJxj4BS5vhLOPNpU6iuFh6Ug9XRBbzKDwL6uyOAAp9rF3mp22ynShtws1mDtpQ/bx0P78kfJAOwJpccHDty4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHujCWWk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UkspscxG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHujCWWk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UkspscxG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P3vx3594108
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iMYnMWBp77TV2qENzpNgtRcZ
	SO5SxyLvA6XoKjxuz0M=; b=cHujCWWkTidRlrat45BIiorrO+2mngzn53H0cvys
	xFGS5sfcY6D/phIjo+VZKLXf4bVw6kkd2ZHkZAagjCBLm9Moug0WavnVQhkPaR0X
	ChKK8L3hEy+3AkvaOHkFWfvSpo0U6APLQ/WRTjC/V5LT5HenkQKCPzt1gPA/mqBN
	8jVkotE6sE3B4+4eaJePKa4LkcPfUXLydTTb8eIg2ggpzU+76HzExBCJJRk5cGym
	1BY66FrF1usMTNV9ewtKFWGnfv8UYSzKHmyYeKsSiiUlSr4I/+xsR2Gl1MS0N1eu
	7UoQTKjUeHA08szGFRJH9yPbMAt2jWpGRi9des6H08zo1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6jv6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:33:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b4b575561so383063585a.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782650008; x=1783254808; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iMYnMWBp77TV2qENzpNgtRcZSO5SxyLvA6XoKjxuz0M=;
        b=UkspscxGqh/a0PLO4t3n9jEzhWammE9wXRRRXhOwHgGWU1VbNFkEAkKp5Lo1dK40Mn
         NYvQxeE74yDgoynBn0WSo/sojDDiEBOwMdX54vrPRnY0JAXP0g8Kq3hTKKygdb6FFu/1
         TWkswixcTEnyFR9Al+s/FzbQSvgw2eHQO795RDZW/lYjbZiYRobxlOo9thzK/8W42r4W
         AG8KAn68fbVD6CTwUGBUjd8JJQakb8DsaaJ63qUEbSAYzOz2zU+LCaABm+vzXSWek1GO
         sW4IYK/ISdVr8pSknHWbi7grDUzc06twXRcBmPZ7Tzdot2EXo7W9r5wUDcdhDC2ez1xu
         doIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650008; x=1783254808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMYnMWBp77TV2qENzpNgtRcZSO5SxyLvA6XoKjxuz0M=;
        b=RsIH6o1WLxEVPWQtiG4pKoWR5+NAdB0IT3UVuYDgGdp8mrVp8PauZfKXYn+KFCe705
         T9Rz/fNZxSyMiOcLzEfS4Kq5zhawOGb95/wFWsAYMOwWSd4BQaed9DtAgYTJy80tyfLZ
         xhUfH5TFhSgiKRQiMBIWXUvNR57hN0RpCTN7nkZNCMDhnMopE1VegBq3orwdLr/firwK
         13yyarrMvZXzghNOF/VUeUS2ACISdDNyZhMMOxXXwPYJYs4bxydHe2aOpWIpQv4elXDw
         SkN8cfyvh5KK3boFy7xrmF+m4Z/ys/baZv+ftI9gK98OAAYZxhNmsOLjjp3+1DSi23bo
         gQSw==
X-Forwarded-Encrypted: i=1; AFNElJ/M4EFvK6RBaq6h0SD1UzRqhs5cLRXfqDDF9zP7xaNzleO9InWEvgdwGRbdR+L33z9K9qHsB6NCWCAgfY5IflA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGvgkJQkzmYO495GhBdO5BvasqVlp3Fyv+6LViPTbg1WErNYu4
	PaRALfD+14/rsjwExEh1VtA1TSpEVqB+QrLTRAcHDTY3inSk+M/OaBYT8V+wwQJb2EzwOImtkN/
	pRkurcv3roAqj9aXeK8PzrewJ6KwIRGTuOldj08olWIGq4d8gyOnwQkojeZcJAkRl8z7jAD0=
X-Gm-Gg: AfdE7cnpbdSSgi+w7/S37/qsR+SQr2Ctza+yMtSqO7diaNLeqesj/PI8I1WLHk/t4wZ
	Bmv85faNSsjpNUalOBWK1P38G2UCV1wxd58hMmfliUDSKypSKRGPVczqb8bzWXbSJBYt/kq/8CB
	zzGG2iicGjvPv5ekfmVHImW9kmIEBqa2Hra2WxBG3CMwL089Q42Pg6GTXl8EEQNc3LXQ2egxZ3V
	ns8AjSWQaN/XvTlc97cH2QXbfsqn20pZeykONZpV/5lAtOGGDliP6YWCeiFSMbMreY8axEVygcH
	DkJP+T24+g7pfYdOLSveJm5/g3zc5J8AMGwlhoR+r3sTLfTxx1nkQ200YFDN+29mFyJwFwOivmr
	0DafdMGS0Os+5Lf2MHkbKRt8yZ7k336EtXd25iOy4SCL8rqlRiyfnyn5G1Oz6QM/sMTT8V3qmh1
	FQaCOIfGK/Iw58D3RrmjG9BpCy
X-Received: by 2002:a05:620a:4147:b0:915:9da9:b51b with SMTP id af79cd13be357-92600a83049mr3348414985a.16.1782650007968;
        Sun, 28 Jun 2026 05:33:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:915:9da9:b51b with SMTP id af79cd13be357-92600a83049mr3348411585a.16.1782650007434;
        Sun, 28 Jun 2026 05:33:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39af63056f2sm9044421fa.17.2026.06.28.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:33:25 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:33:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
X-Proofpoint-ORIG-GUID: RK5s9XXlBWnbLGaombpb6s3K2nGc_-Fb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfX//q1OsEHYaQN
 0HWKRtxnxAefGgCHzCA0JXwgLcNWp+xhoKW9l0uIxcfv70FAwpz9llhqdN4tIS/XKurxl481kab
 i+YKyy5dsFAqSGZdv71e68v6VSAVSuQ=
X-Proofpoint-GUID: RK5s9XXlBWnbLGaombpb6s3K2nGc_-Fb
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a411498 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9oNDkMca_vBqraWRZNIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfXyNHCAEwHAcNO
 g3/bul+MrP5hXcID1z24IMKhVxkWzDn+YgKLvyre0k8OXLHJ0DZJLs0gkx15TTNaE4MLRUz1qUp
 Qd1yx1RmvTUi+T+0qhX9vKCaZRm3hlF8yKLQAaosvrpPY7Y0yEpbV2s+GcO2pwPwvlpPDs5L7P0
 M7AMcYWwynjEl5wT62T+pQr/5O7sRWPO7+qg0gLxSD7MCJS+OdObQdODjh/hbJ2dgir37VCr3Rk
 MKDyYvCkY9pjG2naIjw47AVqlHohAN7AAqLTFoPaFagDn09tOSKspayv5aCIBjhGvYwonjEl9Ll
 tDDIeVayUfJhHgsQVNvx1ligVoRb3Qmym8N6rMZi1kq+DjV2TF9iszOVwBBkJinv9/a5saWUaMF
 PUYa9LX+nkNpSFQdI2k6CnMLehERn5lE9loPZDdv+rgmWE3Jh4KaGMTxREVaM7M46fMY1Chsgtc
 arg7Ii0kTcbNaQV545w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280110

On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
> On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> > On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> > <kamal.wadhwa@oss.qualcomm.com> wrote:
> > >
> > > On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > > > --
> > > > > > > > > > +
> > > > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > > > +         };
> > > > > > > > >
> > > > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > > > such as vdd_s2-supply?
> > > > > > > > >
> > > > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > > > >
> > > > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > > > downstream components?
> > > > > > > >
> > > > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > > > >
> > > > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > > > votes are cleared.
> > > > > >
> > > > > > How is this different from other, previous platforms?
> > > > >
> > > > > This is not different. In the previous platforms too this is taken care from the
> > > > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > > > may have a RPM/RPMH regulator as a parent.
> > > > >
> > > > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > > > calculated based on the active child rails. This was done for all the
> > > > > subsystems (including APPS) regulators.
> > > > >
> > > > > So no explicit handling from the APPS is required for parent supply.
> > > >
> > > > You are explaining the driver behaviour. But the question is about the
> > > > hardware description. If there is no difference, please add necessary
> > > > supplies back.
> > >
> > > I understand your concern about descibing the parent-child relation in the
> > > devicetree, and given that we have been almost always followed this for all
> > > the previous targets, it will expected of us to add them.
> > 
> > Yes.
> > 
> > >
> > > However, we want to avoid the unnecessary access to the parent from APPS.
> > 
> > Why? What is the reason? Do we want to do the same for all the
> > platforms? Only for Shikra? Something else?
> > 
> > > At the moment, I do not see a way to avoid that, if we add the parent
> > > regulators.
> > 
> > That depend on the answer to the previous question. In the end, we can
> > make the driver ignore the parents by removing them from the regulator
> > desc.
> 
> Ok, this seems like a good suggestion, so you mean its ok if we define the
> regulator desc's supply column with NULL? And only keep that in the DT?
> 
> you mean like this?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
> 
> (please let me know if i got that right. thanks)

Yes. Don't forget to explain in the commit message, why you are doing
so.

-- 
With best wishes
Dmitry
