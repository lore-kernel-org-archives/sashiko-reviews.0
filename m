Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779780;
	b=AKT+9rzRJL+T4aPhVIXYJ7NjrOiHcqrp9HWLNScEAQPJJ6oLvbe/pFk3B3sxIlTwFVie
	 vRhcKbyKOhRnkOqWERxb/E5O2FKcypFrdykuLl2fDqvISqBf/SS+uZuwZp76EnISkYsBN
	 +GmMFOxEOv3XUNQWCWeij5CNCAvrON7ZXkrfO10JPRmrYYMEy1+l52F4KVU9hVvHDeKnk
	 y29WZbO6vuvm5NJlJhnZtx6LqJdSDgHklnnryG/cxfDpqyRplexLX8Zt52XowVoViHnEY
	 JEGpc1BlK7SeoI4A2UsbowEUdmUfRPre8P6LIKRo4uSpebdd2JLJNGwK+1vlzSnM1AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TYhHcALOI+73VxgbfGyxzlsxSQ/kvAaheVmCjSZBwZ8=;
	b=VA+1Yx6Fzb4HdbdkDJYnUQ037ASkySj1mLr7KW7g6w/u4meoQDMEahnm5cJM1QxVvGTj
	 mUWgbCA546FIngMn8oCGBxWDkRRqkR7efSUHBWtDMOk7W/FVex5X7TzdP/pcwOiKAgKBW
	 vxLMRVS5h6dimvJtkA43qpurOktlCtEUhdebiwjXv2WZE13bHieCP/F/S3YutLCpU8Ygb
	 a35GwsT1fZzQV5gYRNay5Li/gr4jv0nQ6XYGFdvFRmqJ4hTqRrYjkgoWDUhs+3rAujcK4
	 RWrsl7g3ki5unl/tYzWVWJVfnZsVnlSLQt1v21JG0cFZ6fUFo5mMgHR+fcg5mNeQl+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k719Lho1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NygVNPOF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E8606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k719Lho1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NygVNPOF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApOCU273643
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYhHcALOI+73VxgbfGyxzlsxSQ/kvAaheVmCjSZBwZ8=; b=k719Lho1xNCncZTc
	viO8gVcw1QHA8LTk9BloXFRVAGho7FdpF6rWtSyTviBY7Zm634kFzI7SDkWRv+K2
	NlfVUPMqLMpFfAJJQ6XLQk3+SDdMm/Asc0M9l61aBoehfA1vruFgNFR4+zBxGgVq
	WGRkTEOB6O/dsoFC62plGT3AS/DdFa0vU42FGmw7vISqFQ/Z+8qjHHkz9OCKgUpE
	CFzST+VUhf0EtXibPu3+SgcuoJTRaNlABchUHIvtcI1azE0wnkuEZJfuUXK0uy+b
	eJ7REmEbgh7c55NCb5LAc+4Ncow+sGov+9h+TKzbC+Err1jKCtVGu/bV5ddG91jw
	gPkLWg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49atqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:42:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4cd0f7abfso5075938a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 03:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779779; x=1796384579; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYhHcALOI+73VxgbfGyxzlsxSQ/kvAaheVmCjSZBwZ8=;
        b=NygVNPOFpalsoi+CEy9QhszT+8QmFD2fYk2fUt3DxFziSWp98+4wtDfisyqzOz59az
         EUPRFrBgV28BHNi7YdVrnxeDMtA9DqVNUqG/PozU3UeNy1piNuOO4ldqCv80JuMUzO0s
         T+tILnSrnKzQT55G3s02rRBzakQERLHhIZvSGRf+mVM0NLmx3R3daB3Bh+Amf9ptlpbi
         VfDq+GLpquzskiuKRH1Zvnbo3iGVD/zpNs862zE8h/7SY6YlCx1tz3q260tTFOKlmda3
         twL4vd/Kwoaf8dlVLtxHZnU7cOj2RB6o9XCpVvJxyyJxbZVd4P7vtWHAFmTjRbbQleqz
         aBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779779; x=1796384579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYhHcALOI+73VxgbfGyxzlsxSQ/kvAaheVmCjSZBwZ8=;
        b=J7kvDj6GU97LBKlLzjrInjY/TsAjYy4Ezeq0gFQcH/K4bx44qdvydAtomQS8Pcjzex
         xfeTz/kstqz+eNqwc49Gi8g5bBWKoaoj1TSWI6kmx3DaEDT4ISUN+EkOeVdmNywaFB4V
         mYuqWGPayP262vSMqrM+VMTNIQZsd7+PV/fDhTdDSdA8whv21oAHj9zi/4Sae/uDnU5n
         kHzcqmxnP66gqha2d+uVAd6M22XCmA31NwvOvqmudDJF1ezYaSHyMXuTH65PDNm+LZ1L
         2uPX7GXWkUYt4YJCF5xa+jKBpHayHtCBx9JW3G4/UnvlTWL3vHQlrShWqqj85EK9170s
         YMlA==
X-Gm-Message-State: APuU4Z/ZA9znpDHuhr6ZuTqEimmrf4DACp0L9PsKcBUAmuoAX0YngGQ5
	wOGpdbK7awEw392Fs05E0PXYDrBKeUj0utK4hMYw4eHkarQJ/QbjbivrTcyuBIkzanqkxuHm6GA
	f1wYyiRB7jZ6K98ej7hyIJnmEGjV20SRAcL5AwyjU8i3KRKlCUQ9JxdT6rRSqeo4ctJXKUXwXlG
	0JkN8=
X-Gm-Gg: AZFdTZdk0ceqiPECYbguJGb6DZt5+axUqA11hARQ9X5vIcHhsOYbBl/GVnJ0FUp93SC
	evQ84odQImQzqlghqgvKTBwwGckBuIMsIZLftiBdxFWk6y36ng5SZsUIn1a0j9v7pkFrAOwLRbM
	Zh9IAuCONTpV00BoaLUGHTClAt+qImWNaCyAdLIjAThxPHkuRIMNdXq3YAaq/kqgwAtWqShKdth
	a8JEp5xDRfAQe3taw/EqUWftaUF3H/5bXINf/LpXEcNLqoTU5VY6fIQqXc0RHnLzKrb380XLFMh
	EUDMEEdXiW8kZ4mD7z6JURd4BbyDwBdJE8YxSf5/DrorW+pvtwi58Na3NDkXGLuJedB9yYXRYZm
	KGSogqDjV3sTK1n2bEz8Eadw6V3okPzmsbgSUR8TB3RwiQ5Qa9aBuSCN3Lr6CVIRnwu9KNGTFKv
	awhSk=
X-Received: by 2002:a17:90b:4d10:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b41c852d1dmr24690816a91.5.1795779778818;
        Fri, 27 Nov 2026 03:42:58 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b41c852d1dmr24690795a91.5.1795779778286;
        Fri, 27 Nov 2026 03:42:58 -0800 (PST)
Received: from [192.168.31.121] ([152.57.2.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm16699515a91.1.2026.11.27.03.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:42:57 -0800 (PST)
Message-ID: <39b5e2e9-36c3-4f71-9923-7065f824dadc@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:12:49 +0530
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
Subject: Re: [PATCH v4 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
 <20261126-oob-support-glymur-v4-4-ad4ec5dd4b0a@oss.qualcomm.com>
 <sashiko-outbox-234955@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-234955@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y8G9qQ3mxYERbeG-YSsgFI8OSxS3Tr23
X-Proofpoint-ORIG-GUID: Y8G9qQ3mxYERbeG-YSsgFI8OSxS3Tr23
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX5GiUqy5T4c/+
 koEGujv34nfazFbXk1nZs4LvpIDE8yJzWt8hgyKgZBENEguapTFjKUAMdMuEEulflMr9tXFZPSV
 +waz4k9wSElKXhoC6Ya9NJpGIQojsIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX6ikj3k690njl
 dsW36QefJW6zTfUIVCtfgustmToNVBAxiy3mU41ShcWU3yNBJfYPujah/JCor/rHNjdib1NoRDk
 Xe9zVzjTgiWlxeY2B6Oc+rg4+WFNyscFf4od9P6BIXlk60GmCEa3JC9aXUHIoJV1pMTdL9o4ddH
 J0Z9Dx8UHPF3NT6SM7MkyK5ri5iiVkxdArWt+t7GNkn7yP2QB88Vd749aiqZbK8Vu8/RmMcLSaK
 MdpFBy0/LRnH0iELJJ5o8nwHvyCiOdcDLjoLUVOwILqlt1ajknh47CTY14Knoai7rVqjEyI0Ax8
 Nhk974i/3wMR8t0LaLVjO0a1MsjvwvZsZ7IFLdSUU4QDJF5dhM57vxuWfP+DsK7JBQEvY1T+bL7
 pJs1TcCVU1fyBtPej0TEW+EG13SYb05w2BAfgtbj1svkjzgayLU8AaIgfsYiEDTYtJoYa1kS72v
 wh6p7Mpk8gACwe7taYA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b096cc3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=TrXdLD1AxJi/q6VKlMJ58Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=39Q3AyQdQ4uSGvnyTEYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046



On 11/26/2026 12:58 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] remoteproc: qcom: pas: secondary shutdown errors lost in
>   qcom_pas_stop()
> - [Medium] remoteproc: qcom: pas: firmware leak after qcom_pas_load() on
>   start error
> - [Medium] remoteproc: qcom: pas: missing decrypt shutdown poll in
>   qcom_pas_start()
> --
> 
> commit eeb577211ecb1e7bd112a3fc4d396f7f8f51017c
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters
> 
> This commit adds PAS resource parameters and the corresponding OF match
> entry for the Glymur OOBMSS subsystem, including primary and secondary
> firmware, DTB PAS IDs, and decrypt_shutdown support.
> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 1e55b00357c80..a0807615b0e7f 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -2194,6 +2194,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
>>  	.early_boot = true,
>>  };
>>  
>> +static const struct qcom_pas_data glymur_oobmss_resource = {
>> +	.crash_reason_smem = 669,
>> +	.firmware_name = "oobmss_tee.mbn",
>> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
>> +	.secondary_firmware_name = "oobmss_ns.mbn",
>> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
> 
> [Severity: Medium]
> Can this leak pas->secondary_dtb_firmware, pas->secondary_firmware, and
> pas->dtb_firmware if startup fails after qcom_pas_load() succeeds?
> 
> qcom_pas_load() requests those firmware blobs, but
> qcom_pas_release_firmware() is only called in qcom_pas_start() under the
> disable_irqs label and on successful start.  If rproc_prepare_subdevices()
> fails in rproc_start() before rproc->ops->start() is called (where cleanup
> only runs qcom_pas_unprepare()), or if qcom_q6v5_prepare() fails at the top
> of qcom_pas_start(), the three firmware objects are never released and
> pas->firmware is left non-NULL:
> 
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_start() {
>     ...
> 	ret = qcom_q6v5_prepare(&pas->q6v5);
> 	if (ret)
> 		return ret;
>     ...
> }
> 
>> +	.pas_id = 0x42,
>> +	.dtb_pas_id = 0x43,
>> +	.secondary_pas_id = 0x44,
>> +	.secondary_dtb_pas_id = 0x45,
> 
> [Severity: Medium]
> Does qcom_pas_stop() drop shutdown errors from pas->secondary_pas_id and
> pas->secondary_dtb_pas_id when pas->pas_id shuts down cleanly?
> 
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_stop() {
>     ...
> 	if (pas->secondary_pas_id) {
> 		ret = qcom_pas_shutdown(pas->secondary_pas_id);
> 		if (ret && pas->decrypt_shutdown)
> 			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
> 		if (ret)
> 			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
> 
> 		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> 					pas->secondary_mem_size);
> 	}
> 
> 	if (pas->secondary_dtb_pas_id) {
> 		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
> 		if (ret)
> 			dev_err(pas->dev,
> 				"failed to shutdown secondary dtb: %d\n", ret);
> 
> 		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
> 					pas->secondary_dtb_mem_size);
> 	}
> 
> 	ret = qcom_pas_shutdown(pas->pas_id);
>     ...
> }
> 
> Unlike the pas->dtb_pas_id shutdown below it, which preserves an earlier
> error instead of overwriting ret, both secondary shutdown results are
> overwritten by qcom_pas_shutdown(pas->pas_id).  During
> rproc_boot_recovery(), rproc_stop() returning 0 lets recovery proceed to
> qcom_pas_coredump(), which maps and reads pas->secondary_mem_region while
> the secondary carveout may still be locked by PAS.
> 
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "oobmss",
>> +	.sysmon_name = "oobmss",
>> +	.ssctl_id = 0x21,
>> +	.auto_boot = true,
>> +	.early_boot = true,
>> +	.needs_tzmem = true,
>> +	.decrypt_shutdown = true,
>> +};
> 
> [Severity: Medium]
> With decrypt_shutdown enabled, do the error paths in qcom_pas_start() leave
> pas->pas_id or pas->secondary_pas_id only partially shut down?
> 
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_start() {
>     ...
> 	if (ret == -ETIMEDOUT) {
> 		dev_err(pas->dev, "start timed out\n");
> 		qcom_pas_shutdown(pas->pas_id);
> 		goto unmap_carveout;
> 	}
>     ...
> 	if (pas->secondary_pas_id)
> 		qcom_pas_shutdown(pas->secondary_pas_id);
> unmap_secondary_carveout:
> 	if (pas->secondary_pas_id)
> 		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> 					pas->secondary_mem_size);
>     ...
> }
> 
> On platforms with decrypt_shutdown, the first qcom_pas_shutdown() call only
> initiates decryption and returns -EINVAL until shutdown completes, which is
> why qcom_pas_stop() follows up with qcom_pas_shutdown_poll_decrypt().  If
> qcom_q6v5_wait_for_start() times out, or if starting pas->dtb_pas_ctx or
> pas->pas_ctx fails after pas->secondary_pas_ctx has been authenticated and
> reset, qcom_pas_start() unmaps the carveouts and disables clocks,
> regulators, and power domains without polling
> qcom_pas_shutdown_poll_decrypt().
>

The primary timeout gap is pre-existing, the secondary unwind path
exposes the same issue. This has to be addressed separately.


-- 
Best Regards,
Anvesh

