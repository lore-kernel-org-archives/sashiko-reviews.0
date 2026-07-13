Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2186C3CF96B
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943452; cv=none; b=SNeVzcUtUwL10ukqm/osxyNlLV+iT2us3JhSqosp2qJAfC8+uPCAatpKFcnjyaGqe/KGfr5npglI6WH1XZpQ0bLHqleCGV/2Sefwo4Fbz59J1hFpjaI6wqPEquR3mzAf8oSFP/Decq0DgF8Nc2gyrpbGvHAHbS719OFBU3umI14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943452; c=relaxed/simple;
	bh=YujMEq/IYDCcyQvcmIyGcrQUVG3mK7GrieTZQ8bUe5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pagRHkMjHXqT42vKVRepjVlxYB1BRJUbtYITMUWZAVm/SCWHj30JFHFpjK5b4nMutf/IftrtkCSwjBWrlLcId8rzQL7uDizh9I0/Azd4bNlR/oLzBpVJN6h2Savf3D1KFnvIVeH+Q6/fR/1VuC7no37FxkcAZsrvywRmB26NMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl5QtVgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iok73ITW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl5QtVgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iok73ITW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DAZSD4668623
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 11:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32BCUGnUu2Id1Yusst4iQdiV2C4tMZvFoGEnFIez6Eg=; b=bl5QtVgCx0H4EGBQ
	I8Elbu/BOIru3VWc2N+TuPb/F0MVjmb6Aw+mbfJgX4mhmvEyZfIeHqR6v5ekqs9w
	M/+JuJWBwpgvH4x3EPmM+D8u6tq2fYOSZnj87sX+upNew/WtTTM2Vnm6uFNXQD2i
	AtG4l5sHTEXWG2rQMwaFpXVUdKNC02/iggPRN49fOXaxCN8RDxIX90VWZkt2oaVM
	P1hGt/lISckK1zZ4cBuilzrLYYV1KgI6r7YnWloI0c0w+0hrWg7k9jSJlbR84McK
	gUrRSqIvAEfjZjLj23Yv/shhT6jfyf85YA0O7jSgp6oFa4eu8+RI6bQUA/1BJKn+
	aaxwLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2byf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 11:50:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso4796560a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783943444; x=1784548244; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32BCUGnUu2Id1Yusst4iQdiV2C4tMZvFoGEnFIez6Eg=;
        b=iok73ITWR8B8IQbjb6seeC+C+aCqCikEvMRMS8WzwJ2d1R+qz06pCtetzSMy/bLc0d
         ZiZi6G2lG/+8TsYILxUF4va59iS6yTR1kMPjOMSZn0o1E+nWUaj6hkqqfLajEri6NZ0x
         TXocMXqrHcOuVyDvHWnJ8qsyUobDE6WEOZmZw5IUS16Z7L65yGEoGjrwTZ2ZSRuneySs
         R0pKNvejRA/u4sSRDEnfkpD0070a9tDM62RCFIAn+uuI1n3C3t3LIREx2Fu/dZcyCc5W
         JUY45tqkVFbHq2mgoRjudaNZJ7Z6TkFpsLZPSz4/mVw2yovwR1rW+aVU1mcUNt54l1E/
         Uvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943444; x=1784548244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32BCUGnUu2Id1Yusst4iQdiV2C4tMZvFoGEnFIez6Eg=;
        b=qx9J6Aue8Ei8D1if6iCLtR6HtDcHgHnUUHQKdS5C1eq8sHXLZnyWgP1V84/DtPRXU6
         5qajkhTxB0j+lByMDhdO3E2XV4K/xjkvdg+V3l/Boxs68z1AdwhT/wKOs4qKOWLUp/Il
         n+Z1JCM8JykjcA+ON8qsitTBfxyvvZrRfYCaWbWuau1Ps7E4IfD5vTMfJuKDPZA1jGqr
         aViheyibXrlIbiiy3wE8JJDAPHEo0X/cWbbNU9IaQrHcUj8x+L84j88IFmtWNdhTkXBE
         45XxCv7BbcUNIWVDcsebMWruRerftlICfukmIUzU19iwODll8ZoT76ZcqVX/IUJVeG3O
         5+mg==
X-Gm-Message-State: AOJu0Yws5y1NflPvRGiCn5/HpV0i4ygVKWLCefj+Ipd9D9wNb4s6Gq+D
	DOZQY9CTlZGE7Sd1SpAXKhWJyX+/0pN63IWrOM7kMsmTsvUYZ/RGkWE3iTLrNzFPRXZ3WN7seZc
	4v8abCCyEfQBev+8+PhqU8aqWJEAbhO7ggimc9uEU89D1/xDwlsEoM55i/CwGhRFxbrO+jhvKhx
	OQaQo=
X-Gm-Gg: AfdE7ckACwhNxtzk/sQIoTvzNb6/mHPykSgsxv0vbJtQhT3uGIZ8P9Lh8EHX9fDsbzH
	Diy7gz7CsJN8thrpTYFQ3Hrj+M7QA1inYgacLucTDqAMTFmAcTP7S9RmnHklACjqHoDmTI2yhOh
	8EYYVb1EgeO6wu3K7T6/4PfUIoL5AvX3D1ZggkcwZpvA2I1L2EGNOWTPchfbgAc2G7LAF37qDSt
	0syLxlbgyIQ67JCrM9K5bO+4WihCAhrP7qeth+BEhHzhlJD9cURIrUky5DwHeeGF58XjUS+hL7r
	n0QR73zMw0kpOuNUKq3mp0ZiHEXsdONrmnTGcS43dukTjrq84rG4G+Bn2L/aM4Z+nv8MBOR+Lb2
	D3QGyF21vPDgKxRFsMMQD5WjVTIuKptEhXTs2Aw==
X-Received: by 2002:a17:90b:4c4e:b0:38d:84ec:b03e with SMTP id 98e67ed59e1d1-38dc73bdd34mr7771148a91.6.1783943443998;
        Mon, 13 Jul 2026 04:50:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:38d:84ec:b03e with SMTP id 98e67ed59e1d1-38dc73bdd34mr7771128a91.6.1783943443533;
        Mon, 13 Jul 2026 04:50:43 -0700 (PDT)
Received: from [192.168.1.8] ([103.211.19.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm36700629eec.15.2026.07.13.04.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:50:43 -0700 (PDT)
Message-ID: <0c791abb-9f55-492a-81e8-5232217831cf@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:20:38 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] arm64: dts: qcom: shikra: Add CAMSS node
To: sashiko-reviews@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org,
        robh@kernel.org, devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
 <20260713-shikra-camss-review-v5-2-db53be15dc4f@oss.qualcomm.com>
 <20260713093919.B71F41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260713093919.B71F41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rBuKrk8PkiJnv4hZggECzdIyotFY9Jvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMiBTYWx0ZWRfX5RwHZ2TljODW
 lckvyWOhlbvTW+Kj6j5xbDgdwczyIPivaSRn1hDaldChCQcIovqs+k1A7ZT8jaIseBq6t7qAfWt
 +ICpGOHVsevErEQX55rVlcmHLDyDHswlWVmIoQlTwo9pdD1mg4Umsr24Ny1VOWxtMzUugy0xPSj
 F2N43k7W0bGw6LJp+izWCO5dkXGgcZw/2kqSt0xWRIvzp6k00SD3SQj40D5vqWQMNONLMyV1zXK
 BkKapztZLvRHRwBud8GDtETPhhdNlQljR9wH2dt/awPY2R7fVwgWI6dvvnYD7Ao5h6Dhbnr2Aa6
 lSS/Q1BqdTrTWSBHnb+yfkN9LlE0GrIhfNG5kMnMQZNh+azuUy3LDlNQkvnjuU4brDTHfLe4ddO
 HY+qp8BsS/RQCujIzaAKEtFCXdTcIlZt/DB3w5c9dRmFD5RGuYd8370fNCEekxPfdKLPzi8y9J0
 iJEDp+L79YdZWZBFIMg==
X-Proofpoint-GUID: rBuKrk8PkiJnv4hZggECzdIyotFY9Jvu
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54d114 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PqZB0zJ+pwaroKfoAs2U/A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=beKYP8gAV9hXG197g18A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMiBTYWx0ZWRfXxlwRcGBaMtU4
 HqdjQt6Dbr1gA/IPp5A9rU3Plk8Mk1MWbbSheY5EE7w5oENIbrUWO5TlTiIM10sU8QzCVtcrlkB
 86AVit1rvUKTdQHb6H+e8f6d0Ubbmck=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130122



On 13-07-2026 15:09, sashiko-bot@kernel.org wrote:
>> +			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
> [Severity: Low]
> Could this node be placed out of order? 
> 
> Device tree node unit-addresses are generally sorted numerically, but here 
> camss@5c11000 is placed before the geniqup@4ac0000 node, which breaks the 
> numerical sorting under the soc node.

Reasonable, will fix. 

@Konrad, could you review the DTS patches?

--
Regards,
Nihal Kumar Gupta
