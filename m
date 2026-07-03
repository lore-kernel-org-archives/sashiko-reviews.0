Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B9141734B
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092515; cv=none; b=NXJqxmrLx4Pen3CgUBx3I7zjlrYL5cnTSmTCx7qSrlZYAMSwzezajPdMQkz/nK0IO6ryDhdeTeibos9Unl1VTd8H6VSrYJ/nvo5igiwW89yaeB592fGBj81GBcXOYqnXEEP0TCBNDp01QeraH+prLueW8sWEiNpOc0wbe1r4Rgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092515; c=relaxed/simple;
	bh=150+8HL6LJJfiLHm6ieX1zJrqRUok0x5WkQYbkbbdqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuyrJosY2kQZp+u1/QZn/fHRwzkzVw7SSAodgfdnq+KsVWHvNGoyoPOugPLxwqLGL6e2w0fMuqzmWL8WslS53/sNF2SU1gchvq0UoPdd0kJCQB5OY9pfB+o17ckX+yKCoMPdIhphQfciHiMoE8ybvxCa7jluu0XR3McahanggAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdK3Urio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrzmXNaB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdK3Urio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GrzmXNaB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2teU3772693
	for <sashiko-reviews@lists.linux.dev>; Fri, 3 Jul 2026 15:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AciCzvVuG7PhBcPDjsdU+1dVF4U7pvIIGAG3L/zLdWM=; b=ZdK3UriohUzLsGQr
	5AveQQAoU94llCIcFaCL3Wu8pEcTKGxM/6gPAFu5dNuw8QUzL054/shX4W9G+WzY
	2FMFGmAiIE3e3lO5DDhmkOtAPvC7pNv/4CZsxKF75AoITtxisT5n0ifqsW4nXFFj
	m+8D9MErpMheDOY3Zq+sq4fiNkdMW2n1QnHSdv3hQZWXCXGg/4n8RoN9iZp+2DEO
	wcimnjxg4wHoTQ5GVpAQYPWaIlKNa/Ipshp+3AwCd7bEfTiEE1mwnPopU/dYZQuv
	+wIeouFUfZ5nzPF0avG4nr8s8vLFsXrPhaWM/eQwNLMkLQCz00uYvFG8b5VC2G2c
	5dlJuw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03966x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 15:28:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59d595bfd94so242095e0c.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783092511; x=1783697311; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AciCzvVuG7PhBcPDjsdU+1dVF4U7pvIIGAG3L/zLdWM=;
        b=GrzmXNaBJ9WeT3IDpB2SODnfOcjxXn/Xmu42W043gpDggwLsM0QN/krxngjUpEcKuS
         XCQcrrAil4rKs2By/kJiTFLAAYfUTN5k4dhJ/MlyLnhvICYnEMW9+natMo1TieMih/C+
         2m2n2J2fMyAVeMm2/l1m0ccV8v5EBPQhu+lv0zvVd1Z50Kin3V0nnvJ0Wc2RLQLtjiA0
         74BPBdWFFgl68dE3b3hDHAushlrl/LZqINtJt4VCNVpDTa7zVKDWPkTQ/l0+8LlCnM7L
         aiK67oRaEz/od12+Xo+O1sMja/zqVwFvPDBUIEwYgxwLZ5oxWfy+smJZVCjQCVHCMExi
         DKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092511; x=1783697311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AciCzvVuG7PhBcPDjsdU+1dVF4U7pvIIGAG3L/zLdWM=;
        b=Toha8WCEVIM00tChdk+c9yYMPPOx8mJuiJcsGkLsgSR8kuWSM66X+ay61Hr0XtJfjb
         GuW9u6OWsEdSdb/jzgfvvKufNDjsx4CV2NjrUa+PUI+3Ud3Si8GyfPHrXon2TRK/c1cu
         D0A1pZSWbkt1umug2WAoM0TQ9/kK+ykb/Ege0z5ktTeTbEiIfRyzkD5jsKRRzuP2VlMY
         /IVBaUx8sUlJTCMgmKD3FcH7PZDH6a5pLGaChlp6L9C86nExopJZIJe64qkN3fOdGyuo
         e2F1Y9eNhUNd9xj+WIq2iKyH4hPqeSyyCA0IJh8VcUtnzmyDuHTE19t/TpGflynPIPo1
         XYMw==
X-Forwarded-Encrypted: i=1; AHgh+RpamicWNxvntlZhG9OKD3a20e0oN14zSssaTIlsnLzajCeh9dGXn6mNoHvusLoQ4eiX2BzLdD7H7BTIPe995xo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOCkhFgCOEk+3tbrfVtBZpGJfoO41CHGG/4pbgXjJYyue40+wr
	ZWQYOIr9QBn5ZMz+ZFqc+WL+Qp2qNlg56XQUTZMlAQBApDM6RmPR2HghzjR9LPzUa2O4ivQkNR6
	bBcjDLURl5pCxXwzN+8YTjk90/eMiA8OOsfqWCipi/IU7//K2kOqljY5ScjZ1RAWN6UlfW00=
X-Gm-Gg: AfdE7clYy8o1ZsnuuH1/S7WH3jQhW6Bc9aox/xqpsD9VJtPatzXs6xozHfgDakIwxTh
	+1S0UWGZKTVHRCX7wF65NTh39zFMW732Wl6+OSJekgaGHSpGuj5Kd/419S8WLhawWGGgWHNJ1y4
	zX+gNwabGw5SC27dHDtzQsjgrdysqVv1UUudprzuqkXZlEF8H6GV8VKjWTU8wqzUNBSQ45F3VW6
	AGWQ5seOdxcI729XB90gtUdvGW2KcJEeqlSjDAsPr70PoV8oX3eKz1K/YDzG+OAVdoBLAy/FWZo
	qQUtEibc6Jz6FVtmAqQePJxdppQNS/IIJkpjQIJT3XPVyJ7PqNWHhcVJ2ABXC6JV/6lsP5BE3d5
	yNfkdfZIaEuWshtw2xJF5Rs6N4VKUW/fiHEss5IyR2ZW2o+H/Bwrn8zJSAw8NYZ3LO+FSawpNhi
	GZKde4Nm2GesbnbAauOScjC2LQ
X-Received: by 2002:a05:6122:896:b0:5a0:5805:c8ba with SMTP id 71dfb90a1353d-5be1028b9f8mr179e0c.11.1783092511241;
        Fri, 03 Jul 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6122:896:b0:5a0:5805:c8ba with SMTP id 71dfb90a1353d-5be1028b9f8mr167e0c.11.1783092510604;
        Fri, 03 Jul 2026 08:28:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c3asm548295e87.82.2026.07.03.08.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:28:29 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:28:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <sfilvfwibse2vpi74vownkx32kz2dhkkvriphtti5jn2p32ffx@2q4p7nahzoxz>
References: <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
 <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
 <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MiBTYWx0ZWRfXxZpFBQKE57r4
 J1oafeO5IgQxLAGCU71OJ4rHwCwpogcF2CIoFGKppog7T/QL6ryUi5aqX/sE7cQx8rw0sfPr5EN
 BFo1H43o7R5zhCMJeVxKz4FLBZruAKk=
X-Proofpoint-GUID: q0E1AYLl8CvwUrlgA6Jiss8Ogpi0qc6M
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47d520 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DumtbP4wScXUqnNUUE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MiBTYWx0ZWRfXwqunrYL6Z22I
 791irEKjBcvLyNqDAscdGKTecN70jpHK0FR+iJ1zABKt4fst5763tpveakQhmHl0FSKGJGVBqxn
 5pq/20lZZXzT0GwvcpjDem2PB1d0mCZZd4nkzxLvs9snkXFtISC8Huhq4os83AQmD5X27IUBMn8
 zzhDyeistRvYQyH/lX/7IGs5iDxz+hWYJHZj23JAlqHMnZv/hrArpZZMScOZMc618s92CQOY1wl
 CjdrPTj+pi6SgwmP47LKmNecYeVMt5Pm303SHUDAu1/nVXwVnjXhuVgFPC0V1L7BqTgDoj34Qoj
 DScqlaotm7QrZqYcjY/nSpYntzn0bIvkOMIBki66tIuz+IjNFEiZ35jo4ph4EKVUfeGCjjb7pab
 Y9g2BXv+IBgc1z8C+O3pbxayiY3RJeVsgxM6aynHTsn16Sv3lhaKcEXQoxwtGbMwaU5E9ssmaIO
 zWnY/5/9Wsryb2azb4g==
X-Proofpoint-ORIG-GUID: q0E1AYLl8CvwUrlgA6Jiss8Ogpi0qc6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030152

On Tue, Jun 30, 2026 at 06:12:20PM +0530, Rakesh Kota wrote:
> On Sun, Jun 28, 2026 at 03:33:23PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
> > > On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> > > > <kamal.wadhwa@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > > > > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > > > > > --
> > > > > > > > > > > > +
> > > > > > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > > > > > +         };
> > > > > > > > > > >
> > > > > > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > > > > > such as vdd_s2-supply?
> > > > > > > > > > >
> > > > > > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > > > > > >
> > > > > > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > > > > > downstream components?
> > > > > > > > > >
> > > > > > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > > > > > >
> > > > > > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > > > > > votes are cleared.
> > > > > > > >
> > > > > > > > How is this different from other, previous platforms?
> > > > > > >
> > > > > > > This is not different. In the previous platforms too this is taken care from the
> > > > > > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > > > > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > > > > > may have a RPM/RPMH regulator as a parent.
> > > > > > >
> > > > > > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > > > > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > > > > > calculated based on the active child rails. This was done for all the
> > > > > > > subsystems (including APPS) regulators.
> > > > > > >
> > > > > > > So no explicit handling from the APPS is required for parent supply.
> > > > > >
> > > > > > You are explaining the driver behaviour. But the question is about the
> > > > > > hardware description. If there is no difference, please add necessary
> > > > > > supplies back.
> > > > >
> > > > > I understand your concern about descibing the parent-child relation in the
> > > > > devicetree, and given that we have been almost always followed this for all
> > > > > the previous targets, it will expected of us to add them.
> > > > 
> > > > Yes.
> > > > 
> > > > >
> > > > > However, we want to avoid the unnecessary access to the parent from APPS.
> > > > 
> > > > Why? What is the reason? Do we want to do the same for all the
> > > > platforms? Only for Shikra? Something else?
> > > > 
> > > > > At the moment, I do not see a way to avoid that, if we add the parent
> > > > > regulators.
> > > > 
> > > > That depend on the answer to the previous question. In the end, we can
> > > > make the driver ignore the parents by removing them from the regulator
> > > > desc.
> > > 
> > > Ok, this seems like a good suggestion, so you mean its ok if we define the
> > > regulator desc's supply column with NULL? And only keep that in the DT?
> > > 
> > > you mean like this?
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
> > > 
> > > (please let me know if i got that right. thanks)
> > 
> > Yes. Don't forget to explain in the commit message, why you are doing
> > so.
> 
> Currently, Agatti uses the same PMIC, so we cannot set the driver
> supply name reference to NULL. Since it's an older target,
> we'll need to run a regression before making any driver-level changes.

Sure, just do it please.

> Additionally, the child-to-parent regulator ganging differs between
> Shikra and Agatti:
> 
>  - On Agatti, l3 regulator is ganged with vdd_l13_l14_l15_l16
>  - On Shikra, l3 is ganged with vdd_l2_l3

Well, somebody tried to be too smart when contributing Agatti. Now that
needs to be fixed. Be sure to keep backwards compatibility with the
existing DTs.

From the schematics that I see, the pins are:

- vin_l1
- vin_l2_l3
- vin_l5_l6_l7_l11_l12
- vin_l8_l9
- vin_l10
- vin_l13_l14
- vin_l15_l16
- vin_l17_l22
- vin_l18_l19
- vin_l4_l20_l21
- vin_xo_rf

Please correct the bindings and adjust the driver.

> Since vdd_l2_l3 is not present as a supply name in the driver, it will
> be skipped by the driver and would only serve as a representational
> reference in the DT.
> 
> We have two options to consider:
> 
> Option 1: Skip adding the child/parent relationship for Shikra for now,
> since the DT bindings are not enforcing it. (Ref:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml?h=v7.1)
> 
> Option 2: Go ahead and add the Shikra-specific ganging in DT now. Since
> the supply name (vdd_l2_l3) does not match what the driver expects
> (Agatti's mapping), it will be gracefully skipped by the driver — making
> it safe to add for documentation/representation purposes without any
> functional impact.
> 
> So,Please share your thoughts on above options ?

Option 3. The PMIC is not Shikra-specific. You've spotted an error.
Correct the way it is described an used while adding support for Shikra.


-- 
With best wishes
Dmitry
