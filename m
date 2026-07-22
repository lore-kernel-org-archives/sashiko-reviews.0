Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF5640F726
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718458; cv=none; b=ZCqa0WHBBwQ3cexO65vUlZhoEpUzVreQ1/X8+K+iTc08CumkQYQq0YQ9h8rx+7+03tMlkmi4b4BUA54XgtDKnl5lXmytBGLf8YPmbQNhNJv6vEzkIIOwJ+kqL5o8wdoYAX0MOr5j/3kler7Y9j2XW0wHoiynLI4424JfGtW75UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718458; c=relaxed/simple;
	bh=p4TfVNyRpP1YSf4mAYfUjW3PWGegiwFwtuVgtRbr44s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyrzNOLTmXXHJ49HMgwcMC0AkdPWIXGL8vHLAEamED11ZSISCXwnT9jI48kZBP5ThSk9TYHwlSEMfZ+d0KZB5QvE0V4wEhjxl1ltqCLImYqZ46XkRxq90/pmDMWn9odbo+x3ohCgcOvXkUNUid7O6D1QzVun1TwUvsB8Tm9ACKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYntDN3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiEj0etz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYntDN3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiEj0etz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9DqiY049896
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 11:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QBd0JTPVR+0Tps0UvyFMFdA4
	n4QCSTyrgKj4/Bolkmw=; b=fYntDN3JARlIuVWURs+a/+iGZjuqxlF4p1b95d3R
	LMvXGhbOfJYcF+YaVjI1VpWI2mbKsttflkex+VbYlKXvtoBSqW7E7mgVkzBOtINo
	kFwj+QEZ1Akug31K6E/3gbNa7nieyYBZmlBV+fZzgMXU2mSCgoy5UkiJH2K1bcVd
	+/2KZuR6ocOYnYA6m595rOhMjUgvH6PNMc3X/0qquerU366G0T65txqauOYH0b/b
	tKvx0HAQ+mjOa6cJG3SFKbI/9PDxwNYpyuRX81r9PZmrJJ4A9VN82suyRL0So0XR
	hcFPZx20Ao40hZQ77dTptDLExUYBrR7W62lcVDstPAU5mw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228epf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 11:07:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so301039991cf.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718456; x=1785323256; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QBd0JTPVR+0Tps0UvyFMFdA4n4QCSTyrgKj4/Bolkmw=;
        b=BiEj0etzc76Rr2A5aObxejg9BhY0c1k9+xrfKm32bdRrPHqr81nkpZjUamJTYYe7ZT
         4OFtgdOHh/iHLCgN65NRM6bgNL0+6l+u7gO6wI3Xqklcw8VZdOzMhdU6ZHhZWSPqPh4c
         +7NHjPZ/JJreLzJBIbrd1RlXcdTgvYTDORQmqZwwQKCEzRdPmt2QyLIju/1fTs6Gcsbj
         vSkA1mI1uloBhRHcUpVGTvW9J6/NSKNjuzaJE43/ypJoDMGrQcfYi9MFR+tbPSsM6BCs
         rWHU2bvqv9B6TMYhxBVkpNf5/5O31r4zq92+Tqj56Qfw2Kawnj0NiGQA6fbkYSvAItcj
         u7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718456; x=1785323256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBd0JTPVR+0Tps0UvyFMFdA4n4QCSTyrgKj4/Bolkmw=;
        b=qhaNtaC6XDluF/kGzIb7ZFWr2igZVxxAyzLL3NCN61i0zMfZg88zV6tnWJeuL2+M+N
         QBajmALbYo9ocKKtaLewMfXeyoS8vTfupolTdXLvP7uhNMQ+gbJKoKD4gPkDl3yp0HIx
         H/fy60n9ioXqN8aPyG0LVjqBd/xFKoIUZEdfQ6dIkKZf6DQwPBntlEmAzRa4rB7yoMF5
         Xp7XXAOs6mjsrNaJa2xHZbwfGT695Z41tMNNHGp5ui9wczaSoStPGNUo3hjT8ebSTTAl
         7K68dAu7zo2/X7M8VW4/mKNchB/6ULOH0J3PN3dI+TcaN9XnMp//Nr/IQcYk7k766eHT
         ltIQ==
X-Gm-Message-State: AOJu0Yynw0u9Y6EIPfNlHmKe3J5y7VOKHOWByEy2VoiSGiBTWd6XUAnB
	eR+hjOXyA3rMTqmdCq+d+UnCZGq4A8QUxb50fnjg4Ok7b2n7YNlxpqnuaRf/GJg1waNuey8poo8
	sESxYwhR1udtbtMJbJ5s90lhkzBV/GroHanX4aCkDOQP0w5qF9lUP3rMVD8PmdjKvtqx/FR0=
X-Gm-Gg: AR+sD11FqKfebWmziVjct3QFdZKLq+H1cpUFy5TvziwnIKNfcXYomG3iRhd2xues+kM
	OCAe5hw0iE1fKxZ1jPWfvgvn8TFJtr20PLMyhxskw/40RbNV6xtCdSLaOcAJA8X/8z5NTysStlV
	l+C/M10HXBkLCh40IR41vcF8VeJStd6aO+doJRgUcyX0pAtK6VTTNYkLpfEE0sfAU9GNC5U/Pv7
	jbm4h1REIppb3MaChTglFy9mMIDMkDQYQjH4GQ1zjb0H/PVeqwcxApB/j4k1VQxNwCeCqQDm/jJ
	g0pK4giCTBH/mNRfwQoUDVQEQ3OECMYH+OTeqzgvLCoxwjD4huWNAQ03iwpGrYS7Bv/7V17vvQW
	JD9Tu0QfRH2ARLxBghP865SMl6nb7BMwOViKETGKCL8RyEn6Vb+l8hu399YTQTwKwD1eFj6IO8X
	D2jXPrdR9clrE/Cw==
X-Received: by 2002:a05:622a:1344:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-5213ced0617mr219980521cf.29.1784718455500;
        Wed, 22 Jul 2026 04:07:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1344:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-5213ced0617mr219980161cf.29.1784718454887;
        Wed, 22 Jul 2026 04:07:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8cd3fsm422120e87.1.2026.07.22.04.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:07:33 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:07:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <xla2pmliksqzv3hww6rln2aool4js776uzmgkt5dsvggcuanbq@6k4vdkmmjlju>
References: <20260721-topic-smem_dramc-v4-0-748f992278a3@oss.qualcomm.com>
 <20260721-topic-smem_dramc-v4-2-748f992278a3@oss.qualcomm.com>
 <20260721124005.E00041F00A3A@smtp.kernel.org>
 <6rmntcmouwenb3t5xk5rh2rijd3sc3re5m4aeuqive3wifn6ux@hauua7ltycvj>
 <b8f316f7-0036-4d10-987f-c43d60dae854@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8f316f7-0036-4d10-987f-c43d60dae854@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60a478 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=odn8cRm89JfC27xefy8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: aTiddlXSa0JFf6-3Ob_Wfzrc8ouy3Wwv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOCBTYWx0ZWRfX3NMHHB//meKm
 VmWB5E4cczPYQGxNyXnxPCaloCdNDeHOfZmyvMWT+TTpOQ5c48Jf2NK7oe9daDmtSZewY+PJmOn
 2XDb10Tu37GwM4IY6I4XCKY8VbTjHqU=
X-Proofpoint-ORIG-GUID: aTiddlXSa0JFf6-3Ob_Wfzrc8ouy3Wwv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOCBTYWx0ZWRfXxM+t7s1kBtDi
 e0p1TrqIxeUgDQJNZWfgOr8nXl+ppAtK2/WALR3YOH0xGG9TSiT2EfZ23Nym7jtltfDa1fGaF5y
 QynP9NKYoH2Ek3uINUmKgP3zWSKw/OmUEz+VOhtxDmgBQeqykp/uS7sbzJgLbZZNrgGLRh3AWJk
 Dh2NYJSIYsdnLt+4HGjS09icncW6Hdv2ehe0S+q9s/zFurWPRr4+TzQHq2U4mFmDsXd72gtql3v
 Nql7UbhiqJfOnWEv51UTf3ewpy1KtlkeZsRegc8+L3brjmpESOx5KUtdPTgOTW/aNy+mgXJi835
 MVskclHONxeiOG5Etckf8zMAU5bkQqZJRxrlw10KMgKdzxWG84149qKVWwn6HT4gvXHiN44r/0M
 9EUT26kKDll5ClbB3gQjCP4wqRNfQrwRqeA9GzkSZErohPyRjHt0icG1FZd5JIZ2KW2LgLpjgHN
 T4y/mPUdvSxdSr2yGNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220108

On Wed, Jul 22, 2026 at 11:26:59AM +0200, Konrad Dybcio wrote:
> On 7/21/26 3:40 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 12:40:05PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >> - [High] A race condition between SMEM probing and `qcom_ubwc_config_get_data()` can cause the driver to bypass probe deferral, incorrectly fall back to default UBWC data, and return mismatched configurations to concurrent callers.
> >> - [Low] Missing Kconfig dependency on QCOM_SMEM causes linker errors when QCOM_UBWC_CONFIG is selected but QCOM_SMEM is disabled or built as a module.
> >> --
> >>
> >>> @@ -178,9 +195,30 @@ const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >>>  		return ERR_PTR(-EINVAL);
> >>>  	}
> >>>  
> >>> -	return data;
> >>> +	hbb = qcom_smem_dram_get_hbb();
> >>
> >> [Severity: High]
> >> Can a race condition occur between SMEM probing and this function, causing
> >> it to bypass probe deferral and use incorrect default data?
> >>
> >> In drivers/soc/qcom/smem.c:qcom_smem_probe(), the global __smem pointer is
> >> published before the DRAM data is populated:
> >>
> >> drivers/soc/qcom/smem.c:qcom_smem_probe() {
> >>     ...
> >>     __smem = smem;
> >>     ...
> >>     smem->debugfs_dir = smem_dram_parse(smem->dev);
> >>     ...
> >> }
> >>
> >> If a driver calls qcom_ubwc_config_get_data() concurrently during this
> >> window, qcom_smem_is_available() would return true, but
> >> qcom_smem_dram_get_hbb() would return -ENODATA because __dram is not
> >> populated yet.
> > 
> > I think this must be addressed, the DRAM data should be parsed before
> > setting __semem pointer.
> 
> The DRAM parser uses qcom_smem_get(), which relies upon that global being
> set. I suppose one way to fix it would be to initialize __dram to
> PTR_ERR(-EPROBE_DEFER) and returning that if we need to, but then we
> go further down the hole of needing to assure all these getters are only
> called from defer-safe functions

I think DRAM parser should not use outer API to get smem.
With this issue being present we can later face hard to debug occasional
issues.

> 
> Konrad

-- 
With best wishes
Dmitry
