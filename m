Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107D175A66
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402092; cv=none; b=X1WuPhJRubJHFrJl5ESs5BFT/WH8+JEr6qBUBfw+qyv8eLJ0Ut/s9X6yX9nKmWEw5cac7tgDVVRcgyzennRooPAp9L6euNCRWQyOMXr9jnlSM4kWLAZ8LJzEIKHlrFkiBhvALA1VLk9EBCjWIfqa+fscW9DvqcSUlb+6RDPg2Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402092; c=relaxed/simple;
	bh=TMS/Eni9iJcWLOPOcIhJacQLBtwyb1sBJqX79YJuijw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKMroWiifDGHMf2eTMAC4SiT2LLjb3fDF0mQu2GjPXctI+XYt0SAnrkPqq1o/slIIzbF6cOSt+A8/akwbSW4YDoAkY6bnlCKLs4OZqCJ+mXWWjl+AxQI0v5kA8EZgkl4L9UoMqji5vDlHT3qbC5gVye1/DZuXut/6Op/nb48c+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QR2TJaS2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxh6loNK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QR2TJaS2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bxh6loNK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFeJWQ2737241
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 15:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Lo8pgHVw8dr8EhYjzI7pSrf
	sLgQ/Biprz4uL3xaU+Y=; b=QR2TJaS2SX2+bZ06LYZB+kyL6ZsJHoBYyRt26ndF
	EqxJ6TbUexmudm22+NW4hSFiazz+gxOtPd/8Vrc8hNetPds5pi//jK0Mr7K4ORyQ
	QprkNriUo803wEaMuXf5802rJPLjJ+YRaVu9QGfB9R5HguFvM/je/BdFG/o8hRVy
	kvkKzNUKDkbFRpfXyWSSaLfDv3UfW77O46uDoA6xpZLnEqSr7HGQ6bQSCr5djZ8k
	pk/YhY7dEGH59b0pIhXSexz0ErfVfQRxhFP4LUSTG4+CffCeZLCp/fvZQV1KVRAa
	IcGziadAIwfuyYPTjLr6dMSgLPEFE4uUIm0RZixq4dfWkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8t28d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 15:41:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7645ac9b1so177345ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782402087; x=1783006887; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Lo8pgHVw8dr8EhYjzI7pSrfsLgQ/Biprz4uL3xaU+Y=;
        b=Bxh6loNKau8fczVmP4Rcv17avKRv5zSP9qtzJ0EhwZR7cTbH6RsQb5xjYqnIHbcFoa
         MemLv5mQJG5qu7ggcApRE6i+tXhPmSy+j/fdQbz0cYui9E859FXzj/ijq/DO5VNtnyl5
         3MD7FecuIDTZ7GnWc04FL26frca/AyNl7zgbB8Y+xc3rCtNItwVOoXTBpZ6mIX2CFT2c
         HBxTVKdZ/094CC1sLyNA5O8gjaDQ7QXKdGeEdqkZRZyYYA84T+18hTUtNdYcDZy1uTQz
         Yg4/vi78ny831In6jYM/nQMLqRXYLgDLdBNUcRo1xaXnmvKYWoYkqiglSlnEEmXtfaVZ
         4jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402087; x=1783006887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Lo8pgHVw8dr8EhYjzI7pSrfsLgQ/Biprz4uL3xaU+Y=;
        b=LnztC9vUVpgK6/0Vm5B4T+cjs6nJxp/Jr6vmavGTMQBGhLULjInpIfBVrQpfvaCS1r
         58LA4F2zyD3Ch/+Pe93RdWKkgs0ym3bnR7+JSn1Wv0UqB7j/jZvF7mj5sZztjmBUrp9i
         xSFwHUKN9c5V8KaHTd96yYPavIeWkfsFbkFuILSNc4Cyc9OB78lN6NqGb8mmFyLvEMko
         AKDlsV7qJsK+7yht0zb+pvxoDjF1T1wDz/IGCJendnlcKZayIzhdK/VVccNq4KTWdPi6
         tr7HkLzTdnHs3I9AtSB5s1xoRF9RXPAdIZkJp5tbgHmiQ2uch3MyKAWbeIDJTa1paDtm
         UH+w==
X-Forwarded-Encrypted: i=1; AHgh+Rqt70vDbZRpWPT+7Ch8OZ2H/ARNnX1RDZj2TXXkEEGVB59HJRuR6SYVeYWv+GRzIiQ1DnrdfFd+KE8OmlymnAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJWCDgU45/iasWKqz3vebUR+SDdVYG16dr5fNu8KFjbnmSwOe9
	38sJrLZfrsdQRlE9b7eJsolRWoay+gP4MWdx7gjIqZI/UMuplEsJ/8ipvj3h6JPSSj+UhOKSzWF
	pOBjraQM8W74CgX6lFG4HKVdDvVuRErrTM0c9wNLXctLgUqxBRuNSgsgJd35iGcvr0qQoCk4=
X-Gm-Gg: AfdE7cmztsOtm7U19+hIer5AXFaIbyhgcbvC6TNKlUj0gW/1js2A0vhOPLXKtgPZ0RE
	iVwsYflQpFCQtYQ/6k+rZL+EobI+q4xLxKNTkE/+ra+3U3tKaBO4Gp+we/La+RbdxmYYnaBFh+f
	vApU4+QcSPCMXn7oEZmLGcvYtkcHpI2qt6o4egNQI5ECFaliN9QecUDP9G7Nh54dkHBGE+rKFsm
	s2zqc+mZwVyprtNXkk3m954UyERUItlk8Y8ha2eX0B3UPp5QO17TE4aJ3CPlczBWCP8qRT7H54W
	a8W7TTqqK9yPegKRz2P0dylc14FwE7ap/3mzSjAJLP2l1USHIIvOHnqMPmPm65nIyFyh878/xM3
	lXzBPLSAtgCElMhIBMUlJHZzVwiObYdRzykE1Spd6
X-Received: by 2002:a17:902:d482:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2c7fc74bd33mr30863235ad.21.1782402087103;
        Thu, 25 Jun 2026 08:41:27 -0700 (PDT)
X-Received: by 2002:a17:902:d482:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2c7fc74bd33mr30862855ad.21.1782402086573;
        Thu, 25 Jun 2026 08:41:26 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac88fdsm23947525ad.17.2026.06.25.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 08:41:26 -0700 (PDT)
Date: Thu, 25 Jun 2026 21:11:19 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzNCBTYWx0ZWRfX9YejmE8i84he
 EaTx/y7fQRnySWIGZui8X4moa1CUJv4ONLxr3VkLzj1KySkJy+KHggDhLhtiwkck3tJ5C6HOjN4
 bjhvqQfdWVA1TIOR0PCBDDD2HYGjggA=
X-Proofpoint-GUID: yax7ah-yb_44H3lmsCX7mKTBZ0lC2Itl
X-Proofpoint-ORIG-GUID: yax7ah-yb_44H3lmsCX7mKTBZ0lC2Itl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzNCBTYWx0ZWRfXzafTfZjrUg/2
 0tlrCPWO2cXT4s1us3BBytcnKr3qTM4gIGbH76GmDDv+yH4jqNhihyGnp7F4NVctdsOjSEg1ll/
 EUCMfvixQ2/tlbPjILjeJS9VUy/0nCp+fXa3Xutet7NcgVRNrxwPZ+q1frpzp0YFJxQrWlJWyxu
 t1VepbV9IGCFWw1DxMbmlTsa3aYO17X+yTJ72uV1oR/RjxD8AFdYeLkc3/3HWnJC5hEFLF9cQpl
 Av4oghcGWqZrQXlOTYAfYl1aqavu60vAmtmdtKqLT/HlyPgj7hn2XIXwkbDpdtJ89b2k/6DZj/M
 pXpl7mpXeULSXCaR1oJXfqWSYcaXKSpXM7v6YEFxfKVw+NPccOa7PZoqGhxYno8QdeHADkPCEZu
 TaeggxdDSSyQVxQaue43nFXwqG8eo2pE6UDPkNWUcts5vBOF6Hv+UrAsVrUynyI62iUuaXb2Kqv
 gXiavQ7o7qA/y7U69Sw==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3d4c28 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1JGSnXlUyEB1KsQKyO8A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250134

On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> <kamal.wadhwa@oss.qualcomm.com> wrote:
> >
> > On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > > --
> > > > > > > >
> > > > > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > > > >
> > > > > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > > > >
> > > > > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > > > >
> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > > new file mode 100644
> > > > > > > > > index 0000000000000..401e71720519d
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > [ ... ]
> > > > > > > > > +&rpm_requests {
> > > > > > > > > + regulators {
> > > > > > > > > +         compatible = "qcom,rpm-pm2250-regulators";
> > > > > > > >
> > > > > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > > > > compatible string include a specific identifier for the actual hardware?
> > > > > > > >
> > > > > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > > > > are discovered later.
> > > > > > >
> > > > > > > This can be ignored. The compat is a leftover from the historically
> > > > > > > incorrect naming.
> > > > > > >
> > > > > > > >
> > > > > > > > > +
> > > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > > +         };
> > > > > > > >
> > > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > > such as vdd_s2-supply?
> > > > > > > >
> > > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > > >
> > > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > > downstream components?
> > > > > > >
> > > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > > >
> > > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > > votes are cleared.
> > > > >
> > > > > How is this different from other, previous platforms?
> > > >
> > > > This is not different. In the previous platforms too this is taken care from the
> > > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > > may have a RPM/RPMH regulator as a parent.
> > > >
> > > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > > calculated based on the active child rails. This was done for all the
> > > > subsystems (including APPS) regulators.
> > > >
> > > > So no explicit handling from the APPS is required for parent supply.
> > >
> > > You are explaining the driver behaviour. But the question is about the
> > > hardware description. If there is no difference, please add necessary
> > > supplies back.
> >
> > I understand your concern about descibing the parent-child relation in the
> > devicetree, and given that we have been almost always followed this for all
> > the previous targets, it will expected of us to add them.
> 
> Yes.
> 
> >
> > However, we want to avoid the unnecessary access to the parent from APPS.
> 
> Why? What is the reason? Do we want to do the same for all the
> platforms? Only for Shikra? Something else?
> 
> > At the moment, I do not see a way to avoid that, if we add the parent
> > regulators.
> 
> That depend on the answer to the previous question. In the end, we can
> make the driver ignore the parents by removing them from the regulator
> desc.

Ok, this seems like a good suggestion, so you mean its ok if we define the
regulator desc's supply column with NULL? And only keep that in the DT?

you mean like this?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453

(please let me know if i got that right. thanks)

> 
> >
> > @Bjorn, @Konrad - can you please also share your suggestion, how we can add
> > parent-child desciption, but avoid accessing parent supply from APPS, as its
> > Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
> > recall we had a verbal/offline discussion about same concern in context of
> > RPMH regulators earlier).
> 
> That's why offline discussions are bad - you can't include other
> participants in them.

Yes, i see your point. I will take care of that in future.

> 
> -- 
> With best wishes
> Dmitry
