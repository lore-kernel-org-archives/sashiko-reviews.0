Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979428;
	b=YjfJ/i2BG1DVE2+1Vy+VpiXTHMEjeG7jbTZV9F9aO+SW+iFBOTg6HGwahoYaH0AejDJJ
	 VpbV8609w5BA5XjbagQLdsKGGM89QW3KaYNFmaGMhWJeMfcnXC1AXJGvZiAwd0S7HYHAW
	 pTH66z6/R0W8ROGMPNqtOWfa1cFmkfUBQPcYhDwnQWL39H7+8DkOD9XXdsaK2bzlBpWuv
	 cPlBin+JLqKqLmxFs9l+3Ze2G8nyKE1V9W68ySkZTsffjoSz9Xl2i/pdY+IJuGCNT6rKE
	 E03SoWUBnOTwr0mDWKNEEV5RiddCiXjF751gW3+l20uIxVdGPSTnt0vUcWnGAZPG1vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VJPbv36653KOfKZeFGCpjz0HFLZBmi/kchakmWeIL9I=;
	b=zTsa5O91kquKAOx3J7xFAV96c1BexPrnTjOQHxswKbv2mY+3OIslPn5+DeRrOeaOYvvS
	 v7/C0oGUR2pjTgg14kHo+b1x4YBx1t6DefL2rAtTOb8AppYBA10g4sD4DHW3gY8Gr+SSc
	 tqgT3dLjjhVihopkv5fIfqvK904T3Dyam70IVouaa/4453h420/aTS/LUD6eqSbGEfZ3q
	 K0AeD5b77CtmCZ3Vxet8e6A33WtvM0T5SUqeGgu45hz66/giwiFJSS9BH4gwbo0mO/k3P
	 EXKisxT3RBxblv2QNk/KQBU5WbqP8KxPZmGYh5Tkj3dnMTxJBXNN165A93WSMl3qxhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iH8FpQjS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kjKK+Gz/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89D606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB89D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iH8FpQjS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kjKK+Gz/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6qt2603443
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJPbv36653KOfKZeFGCpjz0HFLZBmi/kchakmWeIL9I=; b=iH8FpQjSkDiKN+0M
	rbuRh5Qd4N/Gsdx4qwq2CLYk3mH7xk5AKaoRIs0PNP3jPypQNvgd+yCJZIGOOxkW
	JQb9+lJNGE2BEnZgM281IzqiyLuxMf9qiHD79uKL3HXPyG6ZVxcfuA+Dyudt89Vw
	hlzvQJ4git28FyumPujKdRFwYv6A7g/Q44NAZVMy0h/pE0bZ239HiDbgYFS2Zhbe
	Ak++psQrMn4rbpnWJQNbIzaHi5s231+l9i1MVR8N1P6AqzDZvJv0m8MlQgul+bOA
	1GJNQ/qkn2e6Gzzz7zjsdbnE/FCyqkoaKTo1uyWSnqr2jpLUePcjhWEkrEBUaX9V
	49FvLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71bmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8c5408e418bso467639b3a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979421; x=1795584221; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJPbv36653KOfKZeFGCpjz0HFLZBmi/kchakmWeIL9I=;
        b=kjKK+Gz/XGAPd5h8M0M/uD7LEtBiiPUMkBjaFmmiV1vqCaxbvBqk8yigVqRrq/6GLM
         XNUZY1oy7DatjttU4sUo/LsPOKXIitoaY5U3i/mW4+LQp1fI/NS4IkdYXrQ/e387qmjr
         rEubadyMAn3rtdlYfwfeW+XkRnYjBch8x0loHl2smxaIDhtrHzH0O/2+AUxaLFRZoo9t
         qYHLQruAdvyUAjiny+mwuAVpudhXYxQiGmc0TzgvhGJUArqrYyPyJltfUMVNrxIFhiyz
         YnpYRnCK1BiWEZNkvS7s1K5BU2K51rERNH31LA9G8m9oOKPN4FccrZCHjA/Iz+sol6Cq
         yRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979421; x=1795584221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJPbv36653KOfKZeFGCpjz0HFLZBmi/kchakmWeIL9I=;
        b=zJTlops1vLhGhY2CAi6YKvNW/DkPqKS93XnuisLXNouzD6cSKMsPGpheRvLM2nnp+J
         RyYGUU3SDLoXnIjayMhXPa0jzCeKCS1KwG/1poZSsZvS7ljeBWe0ZcztlHFUzSvH9N/a
         ILAtmTWyucDE3YBHlgyxOnvS1MZKAUdteIAYoY70ulylyIs0COF/79TOTBjwRYtgzgDX
         AMg/8bjXmaGtTmzPw6K/kXtAlyaaXYsKq3UItKE0wlELkpPE/FsIHJ5aXhzjk9Y1prSL
         ub2gVKnXyemGjvGXMmwvnG/lftBh5xmuMZaMBF6VzqTagH/Vxe7LuFfHMbe4AChu5j43
         xHLQ==
X-Gm-Message-State: APuU4Z8n7ePkqHLboO1ZWhaUkwU1EKlwoMBqzM4lMVtDU3VcMQvNzB/F
	h35MnQzjfvVj5xnL6qgSjqvcMYYdP/qrPQQRb/PpxP3DbGp9shSgo/k4nRI8+0wQ2yum48p7Ko6
	ysXh4WwaYgjj0w/N+5isrZzxmVquo1gXYAxohzmxarTNIGTy/ODt33afV39BFb+E6l9f/oysnL3
	ndE2Q=
X-Gm-Gg: AYBFou3jLJ9fefN5aGUj+AmZyvXRxxkyI9WFxXtPYDmHyuBKyvrqYdWl3RL7kfsc+Pa
	aURNoRkhh7tOQewbKV5HnXg+BUv0PwNFS4qQD8Z4N4B11jMXJtU/HHex4ji7WKRnYXWCfUztc1A
	5nBO9P2Yn8JlX3SLlv3l4liw54K/J5yRH0vBMpNKQAXEL2zGBArx4DSjE7t+tMNZ4kjYcYz99ON
	rMe0nHjLTUIcDglDBu2LgfW88TmMCvT9lKpVRJAUzzSUAKrzjdE+YqGcmQyxKOKbL5liX9+o2Cj
	dGN/oDk9ecpcQxCLCh9NdImLXv+NXIT9cHuMgEzSImRtoG2L6KnGjhwapwPiZlDqvTPk+pdOe89
	bstWKG37YQKYi0HU2e/8ZqEL9G9uzXvDLvJ7yvEY0I5rdfu1zAWamHC8ExXix3EuJxPp5/fp0Dr
	vFYHIZsFaTrA==
X-Received: by 2002:a05:6a00:3012:b0:8a0:6905:248 with SMTP id d2e1a72fcca58-8c5d101b672mr1184134b3a.3.1794979420536;
        Tue, 17 Nov 2026 21:23:40 -0800 (PST)
X-Received: by 2002:a05:6a00:3012:b0:8a0:6905:248 with SMTP id d2e1a72fcca58-8c5d101b672mr1184116b3a.3.1794979419989;
        Tue, 17 Nov 2026 21:23:39 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa2b3sm537485b3a.9.2026.11.17.21.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:23:39 -0800 (PST)
Message-ID: <c6077bb5-5a11-4547-a359-9a3a3b4445c0@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:53:36 +0530
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
Subject: Re: [PATCH ath-next 04/15] wifi: ath12k: add QMI support for extended
 firmware binary download
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-4-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210823@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210823@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3AiGpVJ6b_lDAPwQtiVDVJxEHMjTV_AK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX7y84qzYyod/+
 2FIO8R3UNeTDOx9L6gmSHQAYsng9a8tdeTuHO5fkQNEZdPB/RTQiX5/HconhT5q+G6hs5OJ1JOe
 ljfYfKgV8R4A8/WHsyhSGGDsgfTUhvY6gtRKUJ5CorEI6uMl/vCn9dsxMbf/bv6NNq3TB0ySh2n
 MFF4HHyosFNGv4CX1onbC5v3sHQvQb6SrTUoERYUrI8ay45or4oWvignr5VFa8BI6EJnpFWSmsI
 +fgn1PS2ubVk9OlItbVy21qxV35l9j4PaQCScEWEvHtp9hvZwYQfyIGV2lZnAOlMSTPskOwHG4k
 GRYV3KI478co79s0z+qBZOXCje7k6QdwwRsrCeCKbfyfqZ5yj/5IEebaN9KLNmdhCwJEd9stjow
 tDoIKZbwgkPXVVQ3/39Q3pnHiT86W/AuJJofALlpSBywXJRrKRDZtzztt4MC89snD0X4gbhW4R6
 V2TUf03lIOXqqcwxIXQ==
X-Proofpoint-ORIG-GUID: 3AiGpVJ6b_lDAPwQtiVDVJxEHMjTV_AK
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd365d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ACHI5WYu6pcpcLLTPUAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX7fMQccOTTvoQ
 e7igiJmegP1v0yfz1FbtcS1L3lCn2kVOxiM14rfrdSBc6+TQYPu9W4S1uFbwUOCnlSAqSTAlyMg
 h/yB6TMQCPb5Z0+L8XEXLJkxNRZnwH4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 2:37 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] wifi: ath12k: missing support check in
>    ath12k_qmi_request_target_cap()
> --
> 
> commit d06cd02bf95410a2331b0d3861ca5bf0baa15ac2
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add QMI support for extended firmware binary download
> 
> This commit adds QMI support for the combined extended firmware binary
> download request (QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01) and the
> mcss_ucode.bin image required by QCN9575.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index 69512b82aa3b3..3b60d624b0aa5 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> 
> [ ... ]
> 
>> @@ -3115,6 +3289,27 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
>>   		}
>>   	}
>>   
>> +	if (resp.ext_fw_bin_download_support_valid &&
>> +	    resp.ext_fw_bin_download_bitmap_valid) {
>> +		ab->qmi.ext_fw_bin_download_bitmap =
>> +			resp.ext_fw_bin_download_bitmap;
>> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download bitmap 0x%x\n",
>> +			   resp.ext_fw_bin_download_bitmap);
>> +
>> +		if (ab->qmi.ext_fw_bin_download_bitmap &
>> +		    ~QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK) {
>> +			ath12k_warn(ab, "Invalid ext_fw_bin_download_bitmap 0x%x, host-unsupported bits set\n",
>> +				    ab->qmi.ext_fw_bin_download_bitmap);
>> +			ret = -EINVAL;
>> +			goto out;
>> +		}
>> +		ab->qmi.ext_fw_bin_download_support = !!resp.ext_fw_bin_download_support;
>> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download supported\n");
>> +	} else {
>> +		ab->qmi.ext_fw_bin_download_support = false;
>> +		ab->qmi.ext_fw_bin_download_bitmap = 0;
>> +	}
> 
> [Severity: Medium]
> Should this condition also check resp.ext_fw_bin_download_support?
> 
> QMI_OPT_FLAG sets ext_fw_bin_download_support_valid whenever TLV 0x2B is
> present, even when ext_fw_bin_download_support is 0.  If firmware sends
> both TLVs with ext_fw_bin_download_support set to 0, this block still
> stores and validates ext_fw_bin_download_bitmap (failing target capability
> negotiation with -EINVAL if any unused bit is set) and logs that extended
> firmware binary download is supported.
> 
> Also, if ext_fw_bin_download_support is non-zero and
> ext_fw_bin_download_bitmap is 0, the mask check passes here and defers the
> failure until ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send(), after regdb,
> board data, and calibration data have already been downloaded.
> 

This is a false positive, as the actual variable is guaranteed to be 
valid whenever _valid is true.
