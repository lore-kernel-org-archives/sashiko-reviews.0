Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FA3A6B6C
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866193; cv=none; b=nBi7dOF7LTB2BT0R0xrczk8Tt7SKVRx5VD5p0ADoseMVhC0iEDHxah4yLqjZDzAbD5gYyi++EKPM3FumL9VxuXtso/shkEiI4aAjAT/IKKO00dRX3jw1lIB1usHMkb3d8Y6O0CwiFaILInhZztc+N0zc1R+SIStUcfqCBXYxgqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866193; c=relaxed/simple;
	bh=iyxZrlzp0jx/IPG7Ev8OUWWGOeYI1hFdF8mm+vFbR7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bTmhRxgZBgZwl2/mmHa3aZsRk3SwPq/Ay12EN+4QZynkvtawx8JkRp15YqtDstDcDrTaHwE7p+f+y024TLn+BsvAtnOuk8i3MI1zCLBLfx7Yu35wGgrMqiM9bnDERw1xykuKujhXiuqHcVJJufO5zOEnKlFsSRuZuWVN9OgdW1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R08ORIwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDUajRz+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R08ORIwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDUajRz+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjG3r2403830
	for <sashiko-reviews@lists.linux.dev>; Thu, 1 Oct 2026 14:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyxZrlzp0jx/IPG7Ev8OUWWGOeYI1hFdF8mm+vFbR7M=; b=R08ORIwUBuSkCwrw
	JNNgQPlVVHiTPZVJqaMXvLsAhyyaSkzqqH5fyz7mt55dZnS3Sf/OStHAqXfX1890
	MIkB2hLnhhVKgIxkQLfwrQQonEhObFok3tIHDkw3OQYOJ6TkA+9CPJcVQWcTRL/J
	NUzvHu+z0WPh8wVibUezffAQPG6HZMtbkEIIK6T/cpD5JjGbcZyqOm1FJ27D/swb
	S15m5/gCVSah9+nzCGn8D0RO4OPWsk68IcqaFj7CGxQWXZDDqAE0A5DM2VoB5Oat
	kubNWdmxlIc4Q5kq1N//t5t7YArYiqZvu69p4C7o/EJn38BgnijGhTr5vlcCLI0c
	bYy0cQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sv95t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 14:49:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso3837145a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790866188; x=1791470988; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyxZrlzp0jx/IPG7Ev8OUWWGOeYI1hFdF8mm+vFbR7M=;
        b=TDUajRz+0ErGZqxXZOhBamlvjlyJRlLElMtRJBR6oh7T5E0I0nAayhRfejf8eBIKHk
         8iqD1/gxw+LGyUXMmiV6zlND7e2dD21pORL0h02FPmQqJ7T+et4G0aqxiWF0ufXikjKN
         kfLJ4eUsIHu/3SXJLENBPQ7Dw0+gLvp8z3RCdx+TXaEwUnD1fXxAukTrS3PUt5g9VovK
         Y8D4wYo0Ax4bu7b/YFqfKEG/aX1Lcm/tHdQjFIELihW6TR+T87bDHBHCTJDi0TVhDtT3
         KPxtk7noHG/jA7Gp7f//M+xXO/j+SPaE3dXB8hkVjScy5bLQy2PFOSwokt8LYvU1iXS1
         6Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866188; x=1791470988;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyxZrlzp0jx/IPG7Ev8OUWWGOeYI1hFdF8mm+vFbR7M=;
        b=oxLmNM/SUVieyjcQE47Ld2afMhMD5NoomQcDPtMmR7Z1DYCmFHNXJBLLJFVF9138rd
         3NAZlXde3RilgYKwrvRXgdxun1pX+wxfcvlKtf1gyokeuEV4w8glRGA6Prp68vdM9d+G
         haBa6sk/fN3wijDcfbVyECnTrPWh4aL9lZIv6ADrx7YWTBbHk83u+P9Igo4ZgFn9hjnp
         V9lsyfRe0u4xb24xEnFC9mXLi77MnA71M26XPLHY/yGIChX9Vv4kvO1nJ0q7sRzx+27G
         CY084FRl1xdvuqNfHqLOUOBEO1aYWaws9IPj57+dB8Oc8WYdrv/nohdPv3O8m6K0d8eO
         YvoA==
X-Gm-Message-State: AFq9FYJRBCxMGp2j9ZXFVljsVRTRkvh6JmvsdDZGKcOJeTkowcZqZq78
	Oe4V/cbs2PW/rH+wQtlVmOlDjeCTl6rHAiTZLbU6cWChzvnuYKcSQ/d3xn46GzvA9v6olRhnP1Q
	dqWFDaVg/p9xdxjDRrOMndwU1PsRyFIGi0LBp/NPGC2d2/8wlOastBYc73wuuqynHCWeNWCTA3v
	ndBKw=
X-Gm-Gg: AYBFou0uIOiRTO7H2BrvJmNV6fHoa/p/qK+HmLCILw3eu3BzZWvVa0kGK9Do3msNmWV
	hkt2++1PVo5KCUvMkitSrm9JsK7W5KGWpg+Dop8aOcFHiNZDTIn9c1m57U6RlpYngYVC+Y/vaTl
	j2MrPsILw/7T97x1+AuJLP8gnhDxTf+GccYmKd/qHpbxuO8+jcfL6H/9qM/zVTaYWaucLFlEp+O
	Oeou9Day/o5ytbShgGKR9PRoaXloocrfUR6smoqWixZ/uXtBYtreg1ShiqjhPP0y/DssUBrT8At
	tDnndPek8dJJqYWu3XMIl6k8aFWB7OpHEi4ZQ6IOIuHHDeZyQsVyKBZq++0FojMK6DkUaW3Br+A
	XczQDWaZlhNrwtIbSXv6cGWe/LxbPrEGmpF9c
X-Received: by 2002:a17:902:e952:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2e2e491a20amr39183085ad.8.1790866187634;
        Thu, 01 Oct 2026 07:49:47 -0700 (PDT)
X-Received: by 2002:a17:902:e952:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2e2e491a20amr39182905ad.8.1790866187043;
        Thu, 01 Oct 2026 07:49:47 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099c812sm12254495ad.15.2026.10.01.07.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:46 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
Date: Thu,  1 Oct 2026 20:19:43 +0530
Message-Id: <20261001144943.2452467-1-vishnu.santhosh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921030315.BDF9B1F000FF@smtp.kernel.org>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com> <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com> <20260921030315.BDF9B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1OSBTYWx0ZWRfX9j8Ls2dTJ5ai
 bISsS9QQGqTtA3MiuRzDoRwmozehL/dbRytQ0tDLrkVv+kxQwpML0efU4OsEF3uD3delpvUNxjW
 GkmxqQEr6cFbu3BoE5YkJLvMoZW4HKg=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe730c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=-q9WlQo1SLIOr74ThTwA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: HpzINlCo9iXWPXWaF8lOOoEuffQ8VMdS
X-Proofpoint-GUID: HpzINlCo9iXWPXWaF8lOOoEuffQ8VMdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1OSBTYWx0ZWRfX9inlWMxoR8sW
 AeUkt+bFlEMzmYfIdpvkJDnC3FqL+q+vfK8PUU2VVvLJKu5o4gVv5qT1neY7qcgNptZJrOAine0
 t/m1Yyf59tzJXI4PlXpHBY38M9kWdvqyY5+pugOWel+0hKe6kTQNR2v9zkQxm0EXr5w+RrECS1a
 IrDWVxet4F+Wjpwo4IUfD2UfSdTviWiuOuOtfTkJ1aP8joqC0fIw05FVSbXwKv3BeloQ757uKc/
 4U8CW291ik+N/f8c2x6pPKk/cw0a/ese4vuFiFIXYR+mP8qwB3+6T/o4U7NNdj5iiff3S8ZZvns
 nUSTajYAWd98Mux+yLzZZFL/19Smg1i7sDaxhkqL0AwJMiEOOpkGnp+LBCz6q840JgH9tD0xkZj
 YYGtjomzenn5JPEHdO+sAcWhQcz/PKpXKFiKMxlQOzIEa5VBlMNRQRupkf3TnKduBoppAE5BYRd
 UJb0RKRKBuA7QjHocow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010059

> If probe fails late (for example, if irq_get_irqchip_state() returns an
> error), the code jumps to the err_disable_pm label. At this point, the
> pc_irq has already been requested via devm_request_threaded_irq() and
> is active.
>
> If the remote processor triggers this interrupt, the threaded handler
> (bam_dmux_pc_irq) could be executing bam_dmux_power_on() while we are
> calling bam_dmux_reclaim_dma_pool().
>
> This concurrent execution would cause the DMA pool to be reclaimed
> while the BAM DMA controller is actively using it, resulting in a system
> crash. Furthermore, when devres eventually frees the IRQ, any DMA
> channels or mappings allocated by the racing handler would leak because
> bam_dmux_power_off() is not called in this error path.

Agreed, the late error path should tear down everything the PC IRQ may
already have set up. I plan to reuse bam_dmux_remove() for this, which
disables the IRQ and releases the DMA channels, mappings and any
registered netdevs before reclaiming the pool, in the same order as a
regular remove. I will test this and include it in the next revision.

Thanks,
Vishnu
