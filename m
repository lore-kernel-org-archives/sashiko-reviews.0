Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413788;
	b=fJo07oiPYFmMAGZUZyqgPoXLsRvv+Vh7jlfIA0YDyCcXjellx2qhVUSRA0qeEYVB2d2q
	 7jDWqg36iKRUPdosLFEcRRUuUw8zl8sVE/1kw+SunJda7F2Ire5x1HpwsxmLIt6Jtys+y
	 7RWEUqrWl8e3rukWiWzQlQfFOa6a8W3/uxihB8xynebGvnziqDUqUd4CZ3k7ov7LWS7br
	 jF/j+wkVXLDAXfP9GHmjfJ6UUfZv0kOIxYv40rzzkelRHePLqjQwZGHcYtubu/LHDPkkl
	 hN9jGFd7C3ja5dHyGuH/12CJCojuFXzyCfm9ep1Rb6CTA+8RoD7MSf0JasFXcu6hluQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5IDgReFQA2vWDiUnvoHTagyG1mytZGfUwD0jbnlahlY=;
	b=q5fvhPsnqOPsdgR+t0df83pSoqLgledq9XuVal0SZT7Uj0LnChPXi/8uhYNcEVh3ySQY
	 4QR0v2PxWyhPHq8fMsf04RQlemhNypHeJYS/xG0BHCW/3OUr3dmazTwpkTr/04jfP7zpa
	 sa0TVbuCSZU0/j9qCOFIvnnOn9NowsgZOQY/EiTsOMsDtgO9Xl8pATBavDand6+oWafnr
	 W09d1wGEUvPLHVuJ4weKNc6wg4SS3g1b8BMokXLYBUa9+avoAKv1EUnFpMePTbSvcHAxa
	 rB67sZWuIxSV9fgUznnkDb2eZj7JtY75Hm+UTdqnmvdDHCcTAs8QyuCgo7x3Aeaqibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UQH//AXu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRWvGqWg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0FC606A31E
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 06:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C0FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQH//AXu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRWvGqWg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51Ju13780976
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 06:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5IDgReFQA2vWDiUnvoHTagyG1mytZGfUwD0jbnlahlY=; b=UQH//AXuHFDcMGY9
	i+8SvVLh+VQRzl+8kTdEJIWwGVduX9zad2EuVU5FDBdCdrrSMY/BK0A+SjUCMHru
	oS8oe/wilNUZWDskM29SCm8jtgX2Knr6SyL69UeTPdCrxrxa+23fJl/+Isp7xnm0
	Z90jYQvL9Eo/j/s5jSj4LX6Os0ApSy8yVJWG2YQv8b0FJ9LJyH50M/2qmUYAj3n+
	viK886wf1NfLbCdSXu2UV5opl+pQeQ2i2ytvRuso/vxrs/+irTGdoo3Y2fTB3Zv1
	ZDXyEj97NulA6lgBDGMOvkK8m9UGSzykECT13nHVLuuEeELThN1JIgDJpZrIJvc1
	Qn5xkw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk58dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 06:03:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb96533adfso1741453a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 22:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413786; x=1796018586; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IDgReFQA2vWDiUnvoHTagyG1mytZGfUwD0jbnlahlY=;
        b=QRWvGqWgUww5SW/KCrw4PkZmADzcTS343NDJoRHFypsiQAnoz9aZ0zAta1MGIdoOip
         LGxBAhtYOVBeAgo/gG/IpVzBRs6yyGbiVlbfs/qj6g1sdjnUWnurF2leJX9cqaws2r27
         JcclUu71iCi0bPK50o6zgHeuBLjL59KSg46R99ANjNpBLBNXgbBWTribSy221+nK+hB6
         RJ/0zfrwtE1bB83hwQHGJ2o/UPdXLfdCQ8pl7VrWFddDo/0PiDRQrfOZ0lPHZ9W+sF0A
         7DLHY0hgSL7uMcoIsiCz+xZo40iEHIWqulEPuFlp6QoBw9A4qMImTS2t/HXlomkE/36J
         iTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413786; x=1796018586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IDgReFQA2vWDiUnvoHTagyG1mytZGfUwD0jbnlahlY=;
        b=oDosswLrpVhJgfHQPOxNATjPchM4R0k3DW2J3wCGNiZCzv45cQmfAwaS59Pbovus4R
         WavpZZLgWc17U25UP6m2IDByryda7CoHz309cU6pXOuwJKL5avu9e0l/59dvoy3HRiOP
         470Pu/GtrC1B/XWNx/aNk8Ew6u2TYdwY2H2D3x8Y4gNi7tWAIIpPmr15N8+au+U07FI9
         82qJTv/YyOhqthQH2ZQpQJHoVhPEmCdsmcjOt1aadthX//TYBHbYqdew6tCbxxRvH1g0
         GilSTl0dmTPIxmFld2i1GLQaZRzM/4nHVgFWdDop6Myh3JZahGCfdJSpDtv1mVMisUEX
         QVzA==
X-Gm-Message-State: APuU4Z/sd5Qn81GnWiFeARlFEU8HO/jzFkIHExk0QeM+CmT2rKVGDbl+
	MLr0+AXD8kE94bvLgoaU+Yxg4FxXDy9n55DNP9jZDB8Se3dQpTk22LE8EKR0xgnA9O4F9tgIczH
	j9R9gdLgz/kiXq2Ose1HRaOAMvZKvbXrW1kAausDN+RdjqiWq5IRccQDRcK7iyuH+iKxmhyd65q
	Y9EPg=
X-Gm-Gg: AZFdTZcmP+RRiqerONANRomn7crnQbTgSinPdo1W5u0YVGldvIbv+A7/fPD4o4WcdUZ
	3eX4IxCL1HMXThtfC2CPdqHUMcgB3t/wZjFKOG/qZDvDY5bM7xpinmrrPOmnBJL5bokjLm5FBFx
	EBunlNFqNFg224KX+qnf+mRixPDU+vLkcIjRtd3fzPcpRwbN12fQ464nAYyWxl6fPYcs9tT1oH5
	4Oa6z2h7t3eXgpbeJYwOfrvgj6xW5ym3zDDmCgndB00zjIdaxjapR2lMOYCVbNoadIQc1vem+0g
	gznCh0qPpLOUKq+M/bE4iW736hxHM2b4oHYugVaVUXJnm+Y0FjHvVvNrAs29Yavp0KsRvSmDDXH
	QyjMO1dnRXRH4ZFpfBI9nbZHBb07+NZqRXbyLRfNBqo5rEMGNkopHHEYl4uHt/rR+grKRwdoyS2
	ngrDJQwI8+ulcV7+wl76Z2PFX0c/CVkUMLalNxjbYalNfLU/5FH/fOenGdhv84
X-Received: by 2002:a05:6a21:4cc1:b0:3e0:dbf5:59f1 with SMTP id adf61e73a8af0-4014e6565eemr9235077637.91.1795413785776;
        Sun, 22 Nov 2026 22:03:05 -0800 (PST)
X-Received: by 2002:a05:6a21:4cc1:b0:3e0:dbf5:59f1 with SMTP id adf61e73a8af0-4014e6565eemr9235061637.91.1795413785267;
        Sun, 22 Nov 2026 22:03:05 -0800 (PST)
Received: from [10.79.117.37] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077babfsm4983851b3a.5.2026.11.22.22.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:03:04 -0800 (PST)
Message-ID: <e2adf88a-ecf1-4f00-8ecd-db925f3189af@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:33:01 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
 <20261118-oob-support-glymur-v3-3-2cbdfe208d56@oss.qualcomm.com>
 <sashiko-outbox-221408@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-221408@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EtCBHm4P7db-bErhe1bVf90wNJ-USxZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfXw/rpusyLVVTj
 +pXfIynvV8kiMWExQy5lGsRfZ4SQ29TZwgP5JmqKiUHwuXi9TWuuAu5XWsjquvgjiSK1Hkhprqh
 /CL2gP1aHvgAmhaNf4TLeuly9Tb3cmvkl0QBTf1K9aoNjyAXCC0skxCvG3DjXxxPo8k8XyIXsku
 gOkG3scVjqZ0yzNIsQZXKbWMOL6ypjeEsZOD4mNu+izLc7p0ClEGcqPW+C3MmDBS7VjQ8rPv1UD
 cwTxgk+MRvJH0hV47rMuJcFm39YtoexC0dUpwbLSKj4XDAdK/d/UHtnBimVBITLlMmiZKPm/Oyx
 hQMrxZ6lWmL5CMFYt6wP/UHUnO3Qk9Ef+LjMnQJGeHTDlIHw65ySuqRvbDdsuWVAVnIMy9PtdTv
 0p6ntdDmXKEDgkjkD6vmOrWt6nCD39LJqX2lp5lbhG2QH4BXHTRYwRc9yBOwBOpiOx5lhCx1HPb
 Hcu9crrABp8zI9o1xdA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03d71a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F5Z3lxpYoBKdc1g0_kUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX5/KyMzvfoWjO
 XaKa/qdzaD4pto0NeS1vdiR1kAtBetg+pLk/kkOCw0z99YpZ+TCiZGEgANx2Rgej/YM0KWJJik/
 17q2gb99v7WR7K06xtTJiJPDBf05wTA=
X-Proofpoint-GUID: EtCBHm4P7db-bErhe1bVf90wNJ-USxZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 11/18/2026 9:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] remoteproc: qcom: pas: duplicate dump segments in
>   qcom_pas_load() on recovery
> - [Medium] remoteproc: qcom: pas: secondary coredump after masked
>   shutdown failure
> --
> 
> commit 18ab6cc078bc90d357be63c7984c43a899ef428d
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> remoteproc: qcom: pas: Add coredump support for secondary processors
> 
> This commit adds coredump support for PAS remoteproc instances with a
> secondary processor by registering dump segments for the secondary
> firmware and mapping the secondary carveout during coredump collection.
> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 1c8c0c22c34d1..a167bd6072c94 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> [ ... ]
>> @@ -336,6 +342,17 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>>  		}
>>  	}
>>  
>> +	if (pas->secondary_pas_id) {
>> +		ret = qcom_register_dump_segments(rproc, pas->secondary_firmware);
>> +		if (ret) {
>> +			dev_err(pas->dev,
>> +				"failed to register secondary dump segments: %d\n", ret);
>> +			rproc_coredump_cleanup(rproc);
>> +			qcom_pas_release_firmware(pas);
>> +			return ret;
>> +		}
>> +	}
>> +
>>  	return 0;
>>  }
> 
> [Severity: Medium]
> Does registering secondary dump segments in qcom_pas_load() append
> duplicate rproc_dump_segment entries to rproc->dump_segments on every
> crash recovery?
> 
> Primary dump segments are registered in qcom_pas_parse_firmware(), which
> runs only during rproc_fw_boot().  On crash recovery,
> rproc_boot_recovery() runs rproc->ops->coredump() and then calls
> rproc_start() -> rproc_load_segments() -> qcom_pas_load() without
> clearing rproc->dump_segments, so each recovery allocates and appends
> another copy of the secondary segments and produces corrupted coredump
> ELFs with duplicate PT_LOAD headers.  In addition, if
> qcom_register_dump_segments() fails here during recovery,
> rproc_coredump_cleanup(rproc) wipes the primary segments that were
> registered at initial boot and will not be re-registered on later
> recoveries.
>

Ack, I will register the secondary dump segments during firmware parsing
to prevent duplicates on recovery and clean up registered segments on
failure.

> [ ... ]
> 
>> @@ -748,11 +787,28 @@ static void qcom_pas_coredump(struct rproc *rproc)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>>  
>> -	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>> +	if (list_empty(&rproc->dump_segments))
>> +		return;
>> +
>> +	if (!pas->mem_region)
>> +		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>>  	if (!pas->mem_region)
>>  		return;
>>  
>> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
>> +		pas->secondary_mem_region =
>> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
>> +		if (!pas->secondary_mem_region)
>> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
>> +	}
>> +
>>  	rproc_coredump(rproc);
> 
> [Severity: Medium]
> Can rproc_coredump() read pas->secondary_mem_region while the secondary
> carveout is still locked by TrustZone or the hypervisor if shutting down
> pas->secondary_pas_id failed?
> 
> rproc_boot_recovery() only skips coredump when rproc_stop() returns an
> error, as fixed for primary and DTB PAS IDs in commit 9db31edf92dd
> ("remoteproc: qcom_q6v5_pas: Fix error masking in qcom_pas_stop()").
> However, qcom_pas_stop() overwrites the return value of
> qcom_pas_shutdown(pas->secondary_pas_id) with the subsequent shutdown
> calls:
> 
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_stop() {
> 	...
> 	if (pas->secondary_pas_id) {
> 		ret = qcom_pas_shutdown(pas->secondary_pas_id);
> 		if (ret && pas->decrypt_shutdown)
> 			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
> 		if (ret)
> 			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
> 	...
> 	}
> 	...
> 	ret = qcom_pas_shutdown(pas->pas_id);
> }
> 
> If the secondary shutdown fails while the primary shutdown succeeds,
> qcom_pas_stop() returns 0 and rproc_coredump() reads the still-protected
> secondary carveout, triggering an XPU or stage-2 access violation.
>

Some shutdown-error masking in qcom_pas_stop() predates this series, but
the added secondary PAS path can also lose its error. This has to be
addressed seperately.

-- 
Best Regards,
Anvesh

