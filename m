Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095B19DF6A
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569843; cv=none; b=InL6ODzhjrQCOaFmuSS/n0hLeJrOTxPWblt6ckOTOLHBvTXlO0wtjqhVRokwseWKfEf948lLf8J1OFmVmTsdMMMryzkUCMhbLVCfRTBon0yB/m8f/tDLupC4Vkt/IEqrgufFvfS4sZ4emBpFdDt0wP1xfKeywEr7vr2Myuu7B0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569843; c=relaxed/simple;
	bh=TRJG9+1ZB40bVO817nPs/2tJGAhkcQ5cFkt9ukk15J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxn6Bx/gjvEdTNwQImwC0aLohOBdchs5h1AYRbm7n2a/Rt9ZlRRYUp/1uuD5azQTMV2n2ZLUl4Y2cHYqQKoT2dGpRsFBC6P8DAeg+fAWveCORkR/I7uKdNGufKsMp/M5xyaqA89VqfhsxtW/K5ekaWJi+Ndu12TPAs28PJYOE2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zt8pHVF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwkqVAQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zt8pHVF4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwkqVAQU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0NxbF1561404
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OM8Sy69AmlhuB+YEEPhyCqX4
	gyG3z42cZbvcOsnssW8=; b=Zt8pHVF4FrcgHVf7vXUX7wti8nNZrth0u9FiIGrr
	ZbAeg2QB3otrwmu+PmMYnRo5DrsAY6GDC+SyqiuzCcDKDMekb2LoSkoTa23A6cBO
	CTlLnbHReV5vC7nunwj1O4TonKmiU7NvErzT/GIIhf/xzAQOPw5IYhWDnAidHwD3
	bryvW0xHGzZ8n1BAYA/7P0rED0olamGMmce/is87pLDs+48jt/dRfg3GIw1HbhBZ
	/mTISSue5+yKCBYlvGdMZ5KjEehBG90inXQYSOvu1NTyNJrUOkyuF6fJCpnTopGY
	YCDiD5ktx7vJ9Ur+PuozXSCpaDyrBbFJIcJ+9XvPEO0Nxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbr1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:30:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d1d4fc5aso677396885a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 17:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569841; x=1782174641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OM8Sy69AmlhuB+YEEPhyCqX4gyG3z42cZbvcOsnssW8=;
        b=kwkqVAQU6BsujkaDyx1Db1qKqapDLEVOXExdm24AtfHrT1LbC3EufNSFAGd4bJKnXu
         APxbaznLvSmE7hlp0vX8sTW4TMS4ot4NF6e1MtM+7EY7QRgP+MNCXVxtNsnGScvi5rHh
         kN+Wwz8A20KXRlWMmMkKZfeFOpLl9j84dT6ahMgMMABc4TTqP9DIiIKZ19eD0jxWH8Lb
         2LHvxvOS6XxsvLAKWLpKTFvGZ5hT0ceWKPgcATvqrBC0cSd70dNQUldwYV5j7rH/+ZH7
         OEFJs8Op/xXCxgCJFTAe/CXDLZ1AYKb0WER2qZGHDFOksmcBVHOk4wgSe3qkiyYNxD1o
         R+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569841; x=1782174641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OM8Sy69AmlhuB+YEEPhyCqX4gyG3z42cZbvcOsnssW8=;
        b=PG8izSNWRlDD3ks3K4XGnJ+IGhfGWDOic1+4RRTVSdMxg9p23BzDpLZPYoF+rfwEvi
         V/5X8JGuGdMzlCS4+UOMv51AxE/ygt0rrPqDxZ6fvUkjsvNxDqbx0lr8jJ3OZlQSUCeN
         g5MVH80ZGwUMdwuz0aT0yJpTjoSDVyjzJqqES/iWbNYGfRiIpmkj/oSGgq5KMULiYRxq
         2xMy1g946K+Ku7qSBJ9nhLQHe5Sk3orTQRVzatPXop19VKQacKi8HIbRwVC7E2xLBuXY
         be2BlMk36GhD4w0rsPm6qD31iFrB/K7jt4P3bavG6vISe75Mo59n/bvXcQO1zPU3Ti+c
         xF1g==
X-Gm-Message-State: AOJu0YzrKBndSWWF7rdKdhneLq4arz5JMPcdwx70vPPafUmqvimb2oMs
	dpitB2ShbT+NTUTCTLMr87qEbAhP2147rejsTjyIQfJq/6OXUezgbXaR1gtZWj6XYhRee2TUScf
	wNlytz5Y/gc7sgTyotjrgo5m4+xm9rLrZQj5PaRsDaT7b7PhBzKD75G7+Rj9E8Z2ahmZxFs7HTj
	/+89I=
X-Gm-Gg: Acq92OHaT5EwQdnVuZDdFoLpFT8CXFuFDgjV1cJb8r32orphv2/F3K5cIjS9s6KfAxL
	8t4K4Iq+gvsa8GU7BG7Wk0it2/v+nQtEIPywP4lxs8FhDRj8MVCf1yZoqQnGMPQ+JWtsyRa5JJ+
	R1KoLxxBGGxf2OKUcTuoFIJb9Xb5LI9r8UC0VQAu9Xt8H0Rqyj2KN2ZH/GQt8NtjF6+fdoo5gn0
	ChoyzZmvPOJqsoh5XjHxpnj+qCKT8GycBE6o7mMeu9f9nZbN0NU74r7ATU45Kkpx2CrlkHfBWbk
	7ZwdOH8s5DljDVouid4nhCjCJkVe4pqqhYTGyMkKAUqr1Uq+e+RfJodt0Ayh4ckywKQYyfJb1Dy
	CreXO+McubaFBZFwBdn1QS9qbYHk5HWBRRotoVUuqX3joaPvvlhAgtpUFNmKZsjzvDD50F5cGdA
	kO2JDaXvfyLVDrNnZbOtE3PrNrv67MOTY+MlA=
X-Received: by 2002:a05:620a:7106:b0:915:a953:4b93 with SMTP id af79cd13be357-9161baf5670mr2579888185a.3.1781569840582;
        Mon, 15 Jun 2026 17:30:40 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:915:a953:4b93 with SMTP id af79cd13be357-9161baf5670mr2579878785a.3.1781569839703;
        Mon, 15 Jun 2026 17:30:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162222sm3144448e87.17.2026.06.15.17.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:30:37 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:30:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <p32fxlxsjtxbo2i5wqvrt3dxh7ozvrhqby6xkgpctmfhe2npr2@kucx4sxvijdx>
References: <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <20260616002148.EE7CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616002148.EE7CB1F000E9@smtp.kernel.org>
X-Proofpoint-GUID: ywta_Gp2qk3VsrWvt21CbtkO1O3CPrWd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX9Dk1mMhiKU/g
 hhNSLQex+DdzTS6igOm/MNtbPt+haSMJDGvwxMGk/3NpLIoXLuzPJ7HA0UT0lMmSmbTZIzcqVR4
 Xbgqma6kbqsCgaMWQoSQkW31/jKTbg8=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a309932 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=ErpfJ9jdl2GgYSnf1vMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ywta_Gp2qk3VsrWvt21CbtkO1O3CPrWd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfXyOrIytIjj5ZK
 QvsRmcPG4bdp1UQ92LGyp/fnmXkXL6keGqTqBDy2hwZxee3skJjCChNGAefqtOMRUaS94gSWfAO
 PO+dwO2jLcr5W3Fsg3RdLF8h9kmZxCyQppiVK8DWzyeecCL3ZlroPtMGRcagc8tqYAK4X2bZagZ
 ImRpI1UyUGZ+kkDSI2LirpkQno2ZJkopAD6p4BZjmsN1DYxelFLd+UYJQCuZynOZcoyKmIoyCOg
 fZM1J22Q+Ymw+Xqj0E7yrzdelNP1vLmr+XI2PWH6Wgaj8CA6OKT3hPhEliML71xNORhpIPQ1Fti
 Nl3T/5s79KG2c5HLzkEPyk5njT7c4o5RNOwEUR2bqqEjAHDxh+a7Z5snHVkD8z1m6oeRt2n95xK
 smJ81twEK2bAX0k9bR5+a7sULoJ+Hagn2JH0zl3cWCqVaPc7B7sLQ6RI5dDL/D3QNqKKHEvd296
 3SM9SkfUFr6SI6xyi/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160002

On Tue, Jun 16, 2026 at 12:21:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] The AR50LT decoder line buffer size calculations accept an `is_opb` parameter but completely ignore it, failing to allocate memory for the VPSS line buffer when OPB (split mode) is enabled.
> - [High] The AR50LT BIN buffer size calculations for H.264 and HEVC ignore `num_vpp_pipes`, preventing proper buffer partitioning and alignment across hardware pipelines.
> - [High] The VP9 AR50LT line buffer calculation omits critical component sizes for DMA metadata and QP maps.
> - [High] Missing SEI user data allocation in the H.264 AR50LT persist buffer calculation.

Vikash, Visnu, could you pleae check whether buffer sizes for HFI Gen2
are calculated correctly or not?

-- 
With best wishes
Dmitry
