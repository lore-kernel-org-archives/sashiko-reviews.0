Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B63EFFD1
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599329; cv=none; b=YSVOEZNQWAUVzC+1X4fnwYdfxq1QvqcbxvcrPnEoegkep4AL2VD3A4woVnTaR8aIxvL9DxTxNX9Kmnq9BcWAZ5AgcR7XTy6q19sTG5Tb1AkB9pr5Y5k4Axn0gaVA0jyRHPaaN5r7mV3bG65Y8cpLW9kTEBDcNQh9lSTBODoTCro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599329; c=relaxed/simple;
	bh=4DHPjlHLdj6J7HkYDBhZ7UPu72CXJPLetcGH7D6pLbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMGr7NmXv6QOchZ+NpSHUNJiV5wGHFf+gz6F/ZOvpV2Jokb9Bh1OKi0ALuLysizYVs39hASYdCv7dg+UE0YIod1Y6UsQ/GJKoMdjqbYWg/JAi7DE7DJBAh5If5zxEhPXfSgKSRs3wslOebJklcYQnbguVQJ3szp9jWBiYbC81Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fikp+o+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MR3cPX+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fikp+o+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MR3cPX+T"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNUBc1575739
	for <sashiko-reviews@lists.linux.dev>; Thu, 9 Jul 2026 12:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1ClfnulykakYWxfiN6hTT4mRoy9cKqDFd/GfOqMO+4=; b=fikp+o+E5petAbo5
	NWi66rI3kl/rkX5CRx5LtCj7NfqIl3ohsKBZq5S2iKkA2wbCJsjS2Je/VEKQcgzE
	rQkSX82JsdsM0ynQT8OpAWCIjs5FUA+XxqTG8a6dDXBfth0AWNBGTIMDuHxO3R8v
	u6U4uW4Pn6KluL0/2vsZzzQL0Yt3sKbOB9ytSEWDrH89eT/OGgMM3l3PyyuCndPj
	VVKFeJOvk9rHMnafLbkqzzQyvRA1Zzt04ztIkrMK4ViWq2wWO3mtdpfZo+FocAV5
	0qxBK61RbX8GYV7n48bBKn6fd39yU72reQERS3aHEPE1e+OaTRyqp1y51aJAErOC
	jBF6jA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwc42c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 12:15:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so742745a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 05:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783599326; x=1784204126; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1ClfnulykakYWxfiN6hTT4mRoy9cKqDFd/GfOqMO+4=;
        b=MR3cPX+T2k85c/8F3mW1aaBVI6jhjcs/jAC0IjRslUMefowN3JfoglfkxrxbLPR/bC
         wmffD9wBDI+VRpav3FBMlpDR7ERTEAZnmG5wm8MDhGzHqXNIMvZFuXIlduqQuf+wWuux
         aSoNIOGnLucvQvrV9J7N8hyPn1IIhguhpAKIFyVMvxC/fU07tezHzlVWu/kNwmYkRuVB
         AYTignYfJsOY64n8hjlhUE4M+E8wrZbQqm1ydXl6hi4SqSpk39F9UgvZkO4Ipda68NLE
         ta+5gUGGUMLuRS8UH7VQsyGZtIvWuHPB53fK1KUWcqzKO0EFC2K3kT6KXKuz2oykbBZM
         iDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599326; x=1784204126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I1ClfnulykakYWxfiN6hTT4mRoy9cKqDFd/GfOqMO+4=;
        b=imNiK5JGhg4noa7Dr7wIcgCE51veqdO6kgWgmKHvudCEBaWV33WETMI8gZyIBNA5NO
         2QKeVmN+NNoyi85HX5qq6R3ESf/+vLg8maG3+G4CWLg0jSfxlwJtn2CXNLWNYZ+L4wRN
         F2ye1M8mN6kLWozuq1tg+Y8DIxXGokarBDiTobWkBMWCG3vdPTCixuExJa4S7PdtVE7w
         b5bvh8EQOhRZtRvTzPlqXonuWN45LVhUvHbgLFm4NKRnCJjmWNi8vzNeVQKeS3q2b7Gi
         LUIEOE6jhUYkaiZyrVJZGfZC7rOq5wUZxW4V8Zk0yamwCxq5dgYC5oks8C92QkXAt1HY
         ptpA==
X-Gm-Message-State: AOJu0YwjPl/7kf9f+H+yhdTH7Dd+gaE689FB/2/nrYvD6whMkVZqNdpV
	rXaTc8gXg8764nUrhaAqv6815HsrD3QTXJillh+9Hcgv39Oa3v9VVyFRDLZPl5byv059LRmmi0/
	CkR4k/E96LHOsM6dwifjTiX3+a6VWfZo/toEpsyuvTxbdIK/lj81ip11lBafhTy7o4c81yxk=
X-Gm-Gg: AfdE7cklakKAqWGVkRetMNdbo2qWYtcKPOi/iosltL0KhMPUy5VjJVO1I5W5Bd1EgFf
	NO1NLI58YBpZcTiXy89pNM/JjccQBDnJBuxSqf0/8RrHleg7I0iE6EYmhMXIIeX0jl7AowD/Wr9
	QSP60I21/DyDHkyHgpD5DwnLAesXuEcwfjVNFmnSUyMNr/nQjUn49AzT8ep1w89TMhmlf0T7oO8
	LHc6gQOET4y2WfPe9b7lfhKLwvBmL4gN3sWm9ovBMRD4k2eBONhpcjFmxXVnxaW7XfbHE8uq4NJ
	s/fje3JyjTMCECMo35EEEkhd999fMIyr24UYUFC006mErRIz7ylrpGc8dsKeFZ3C/FKU+XNf5eQ
	1pkT0OdBvJxvUUykZKDuiOk0XhDoR8h5B6VmuMYeUJhA7UGkEuWGlrWOJZNkY
X-Received: by 2002:a05:6a20:d81a:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c0d6c6f129mr3431095637.37.1783599326179;
        Thu, 09 Jul 2026 05:15:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:d81a:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c0d6c6f129mr3431058637.37.1783599325730;
        Thu, 09 Jul 2026 05:15:25 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm50551004c88.14.2026.07.09.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:15:25 -0700 (PDT)
Date: Thu, 9 Jul 2026 05:15:23 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <ak-Q27DbuZAuT69h@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
 <20260707102536.0055F1F00A3D@smtp.kernel.org>
 <qek6vh2xcc7haiz7w2qdsfpglewxltbpvjedijqnf7bev3iux2@x5cqyojrwjh5>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qek6vh2xcc7haiz7w2qdsfpglewxltbpvjedijqnf7bev3iux2@x5cqyojrwjh5>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExOSBTYWx0ZWRfX8wI3uMYGtRn4
 KRC7hG/i2VxI1QeN+vDyJK281Am6Nyeo6vtGnT61iEcG8yBO94yBiMD2l8EftAWuRziR9U2yp9g
 x/qF6V7Yj5SFyD7MAn7y/ZPMZfruNhF0ZtOR9neJHKhdJOKphvCNzhZzIWLTOhumK8wg7bnNgbU
 d1iU8IRl0TBU2hRzBwGG7R9nb2/rjgNHrNwQKmRXesxBJ1+xNUBNlVv8U7rMRjIjOl5xterttFH
 3642OkvSNilNkMWcJiOMdRruq2juSkELRWGkH7X6OBQqdtZGXgV8PTE9AY9Vj/hEkkmBzO/TCuB
 KK3H847d7W1WFviN2F+xVVDNvcVrOdwnwOxKXZ4RCOVYci7a+uRU6jJbvDmMvoYyoG8fCtvGUGZ
 gYm3pRxU7lYEkqXnvvoOUnFZV7Fv/znG4wHC0jPB/ebbcvasEiaCmt7Bzqvi6IBjaoZEvBpsCnj
 B+0RmMT/DXLeiu8jXvA==
X-Proofpoint-GUID: 3nH_lr8NOTwbsB4n8iYqre53SLOla6L1
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f90df cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AaYUaR78CUu4QMINtNYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 3nH_lr8NOTwbsB4n8iYqre53SLOla6L1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExOSBTYWx0ZWRfX/+En4nR04u8g
 zjq0va6g4tZIKLsT8NtwC5yVOO6a1T/5yx3dg4OVACp9JKZ0MX2H64d5kbRSUP89ZT5l0cHdYcW
 mpMc5kLWmxOcy8ZjDs+vll1L8ePniSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090119

On Thu, Jul 09, 2026 at 10:18:03AM +0300, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 10:25:35AM +0000, sashiko-bot@kernel.org wrote:
> > 
> 
> > > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> > 
> > [Severity: High]
> > Is it safe to use "qcom,kaanapali-soccp-pas" as a fallback here?
> 
> It doesn't. Please fix DT bindings.

We assumed breaking the bindings wasn't an option, but given everything can land
in the same cycle, maybe it should be fine. We'll fix this in the next re-spin.

> > 
> > If an older kernel lacking the Glymur-specific match binds to this node via
> > the fallback, it will use the kaanapali_soccp_resource which does not set
> > .needs_tzmem = true.
> > 
> > Since Glymur requires TrustZone memory configuration to prevent faults, the
> > Kaanapali driver cannot safely run Glymur hardware and may cause a fatal
> > SMMU or TrustZone panic during remote processor boot.
> > 
> > > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> > 
> > [ ... ]
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com?part=3
> 
> -- 
> With best wishes
> Dmitry

Thanks for the review.

Best,
Ananthu
