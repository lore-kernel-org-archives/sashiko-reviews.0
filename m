Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444147;
	b=l9YTv4Fz+NN3dupqQZ9dhOC+ngBsk9V9h1GsOiT0cADRlOmJ6781izx1B1StVPPLT/MC
	 rP5HtzVTNQGQUNaAA4uoN4ym1Tyav1nYjh4e36dMsab2lgSvr90xlQmjNg1A15YkyCF/q
	 gSZKibzTEfnGqcmFgEvgIB3mo85OYfJrtEyWSZAlykyjcRQRP/C3fU+U7hZwlcfbjtTpy
	 V3eQsfXTvHSoEy5ACHrRpo+GaOO9Fsl7UMgysnLM+zO+1NEHY6F7UAVX5gvg3pAkMsKAl
	 dVO30U6A3OKeNkXsfQ49Cb/aE5LS51LKtiia7+bnWHFfT9U2rN8R14LgfhfXloNXzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
	b=P2lUBuEnL+g2i+SMOccHc0/eqXfjC0eT7LpaIrkI1MXDYWFh72t2n9q/D1ljV5TrBtHP
	 mENh7xTmmzcepnkxMnr3LS01++eYvVtb4NIgsVXM/iY0+C61/Qg+KmP2MRoICOcymZazf
	 EiqgvIRdSTscBZINGH3ydbOGIFtbfNJsfNS9cyppF/vfGCWgiXbEIc2rknhd555xSglpa
	 tuJVsyvjfduxKUL5Vh7HL9HkTkEi5FrsUTZQcR3qNi54IcyO48FQhtWLo+LhMRfi0dfBN
	 ELdVXq/40EzJREj1VSespZhA3F0Nwe//oI1DgAr6KZqFkG1gjXGJ7DHxQOwHD2xR5Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLqCeMem;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkTmpp4g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560CC606A31D
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 21:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLqCeMem;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkTmpp4g
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJKFhL3475897
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 21:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I6PH5lkRkGT+Ul9o6wulr3IQ
	1M8M0Yi10I0lGZq7dOs=; b=LLqCeMemUnZvxJ9jz9bTlm9WQlNXFQfobSZTvgWt
	LbG/3eBpBOOjSGsRIyVM08Wk4PRtYLCaqJOXXM9R15MjMweKe23KgWmok3u8qgvC
	v8T8y9gxJdP5wH4rm7zywGaoHMHOxCI4cPfABHLqgRODBbqGJHq4Psq+WTbZ2ww7
	P8tlFz6SfN7ZSLO9kIVf60W/LkbYv5l2DL+/OfvvPVjQSwsFFpOAwW6Irmgcd8xx
	5YAalNB8AF3wcIBLsw0/3M9oj76XaQWt/98PqJftAGVcKmUwi1yaEHuMCWDySoPD
	5mIhpJL3ZWtabzMYv7dKxxW1FR2lSvoyR88r88gKB2KrYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdqtf8rth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 21:09:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c046843f1so6095286d6.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 14:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792444145; x=1793048945; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
        b=dkTmpp4gTmPCxwnl3IffvVj4Vq+dyFH28DY0Bg8hlfNY4bRDfPo4dcpaoiz+maOMWF
         3ijgQt+lEL4VWObnPDgbYFj0+MKL+MlBviMlwmghEUGiiD/r9hKv86XDLgEEvFoqhZBT
         7/bNJPIMaomlxFe0C/O7QQaqWWlA6z2HsLk7wsI6M9o4gmBZShOd9Gf1VWJKC1a6mUKm
         s02ONOvAebw2JGK5sK2eDa9rgKf52YcJXQA2FMptmEJXnq7bfqA+QWzwL612lJK0bx1G
         EqJqWXjwHAwFurAVvaxZ3pJG0gY3aPV+OxCqTLRoXeKOnSjhb0YMx4Fb6RDvDqPdxtLG
         a9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444145; x=1793048945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6PH5lkRkGT+Ul9o6wulr3IQ1M8M0Yi10I0lGZq7dOs=;
        b=BUnR4bFvmwCNS+cRl1jqMddf+o/FdNNuivHiQiOBjXHG7gn/DjwL1k4TEoOVIMTgv7
         ImmDKodIBdQdtr3IccbyTn3eSuGDtiaQCz622jmR81EPsCPcBukJBEI4N3OVygUOIxEr
         1VexyYAOpnvPxwTSaoCYaTeB1+GdoHflZ6vEkiUfl/5ByDK4VlmD9YAhHpORuWtA7/lK
         /zUyNt+Vl3ENb61uu9t9ctVosqHNLqyPk8t5nqg6t02Q6grxZK1NwHGat35q4XAuzcQu
         BnqS7NhsL3/OTAKWOsaWHXcVNr/UE3cWhMXbc7ONQuxO3hTj956xYhpfJx53hG4Ypblt
         8huA==
X-Gm-Message-State: AFq9FYLeW8HBkYsrMh3WsZttcF09gj+2rXEija1uSFACVeVQ/qBnaxFe
	M+TRtNFG/ilC/j5kH2uQYTvrLqGoeRIrKp1rdYx8+8d35E9AlV1pVYLOIZG4qWLdSHognzWIBaa
	KEPfSnW0TaaxGc4yA4CfdtVL6TMI02bkT8IlNOe9sbMg5wMbq13Q2tplk+DH+evE3Aat9lsck78
	f/arI=
X-Gm-Gg: AYBFou1nawPbFTgIVPIwcVoOdgQIeF9mtELKuQHvEWhM/u2unpDXiDuPRkr7Fs7pgy3
	Vyx/D/Mu2kw37GWv+2z6yBfRE+BAmkAIaq0sZh1WEe3rt8FhaSQbTG3rpBpA1rg4V7USGM5LUk7
	wW/0pPbwyHW/iSRUjA0HPbsI1oHusNpy87JuzRr3QdZIM8yc3Jbk91K5fJ7BghElLFcHiDrvP+B
	zFOV+620w8f4A0XB1rKN6DmUkbj7H7FV0lcI1vN8unl0xWZedK8BdTAgXyLfeXy38XIL0k5c9hc
	EPN+tNuWAQHQNnuWM+VfL/CYAwx/COHRi2I3NqTzzoEZCuN6Ec17W3aGL/n+P047IeR3Y5i2pWH
	LlIc4PgId+RqHGRRishgXRtlXqO6QqhbL/b8flq5Gsonbvho6GmsjLbV5xjUuoM9pdfitBvS1OS
	12gXeQvRX1bWrS
X-Received: by 2002:a05:620a:450e:b0:93e:d1d0:67f with SMTP id af79cd13be357-93f29d79545mr1444698385a.51.1792444145437;
        Mon, 19 Oct 2026 14:09:05 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93e:d1d0:67f with SMTP id af79cd13be357-93f29d79545mr1444696785a.51.1792444144985;
        Mon, 19 Oct 2026 14:09:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2280308e87.42.2026.10.19.14.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:09:03 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:09:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Message-ID: <pzt2y3ruacpl3eky5l6kfud66pdqd3dlnifnb5e27cvipqel4s@dx2rvvje2hcz>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
 <sashiko-outbox-177755@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-177755@kernel.org>
X-Authority-Analysis: v=2.4 cv=SpEFe/O0 c=1 sm=1 tr=0 ts=6ad686f2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YIeo-Y4wl5u7AN86ee4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NCBTYWx0ZWRfX1fGG3q8mgmfA
 ILejhTK7mgod4F9qyr78NerMMrn9NKHACE9tD7WSEtBTPCZbqia93ciqgZPmtgyqS+1PwOUH4ki
 nZRaZM6d0tYIi3E2qI/HdahuKdrReOBT7XFncI/zixZubFmIOO5zlI6QiDGYG3PBFl5PA96J53C
 loyAcSEZ52ED4CcTcAQFXTQEMVo1MyK5dTGtMlUdOMBPEFR7spHgwMb03Wix/jKKsjveohxQrY9
 U+lTcDjmPhvbfS0lF4uD5r7fmaR6wgliQsWo7/jec9Ut+2GAB0hRYkP+w8Yv5X6svAoy1G5HraX
 URfBNSuCkWrvr2uIUOLGgC/98rz2HEZFemsGvJiNFrVoBBd97LQYNjTd9usTKOEYDZunisnpSjX
 3cOZIqqkHRmLHZYTFHIvTkrjSTFFn7StMmDComkuNgoTdbBA6b8k2rCB5bwvwEqL6levf1IAxE6
 mMHY/CL9pSFHr+2jgUQ==
X-Proofpoint-GUID: Wjd6EggjxIpnf5lMDPb-h9oD5zSv2JZJ
X-Proofpoint-ORIG-GUID: Wjd6EggjxIpnf5lMDPb-h9oD5zSv2JZJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NCBTYWx0ZWRfX3OCGpgAscJvr
 pXA0oryYrJ+L7ELZm8hr3VUJffUFS0NWy1TRiV3IOWOmYe5RBlJ0hDJA+PZWcKPuUtaTtHAws4S
 1isXsln+bl4RJwtArSu7LUc23ytjGuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190084

On Mon, Oct 19, 2026 at 03:33:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: missing output-disable in adv7533_int_default

Yes, I'll fix this later. The current patch worked with the older
pinctrl tree.

> --
> 
> commit 18e53f95f5fe825b6b2171c0f9241c69a999af55
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt pin
> 
> This commit adds a default pinctrl state for the ADV7535 HDMI bridge on the
> Inforce IFC6560 board to configure PM660L GPIO11 as a digital input with
> internal bias disabled.
> 

-- 
With best wishes
Dmitry
