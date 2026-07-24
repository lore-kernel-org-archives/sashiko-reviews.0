Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B93ADBA4
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879119; cv=none; b=nSrYfl5Arbe2R8bmobuoKSHAerGlbzayO/J85Gf0TFViUCuJIFnuX9ob0GF1ldSj3qBA6rTAPYhKOSdbwjcogcSmJWQ75sPl8Vuc7NTMSLPXn6LdgCeJoTa3Crxqt07U/x50GUx3Dv197kHa7mZy65wRFl/vcUA1fgrLu8gIY/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879119; c=relaxed/simple;
	bh=ANJtyJ6P389yvOKckJ7iYgYvw5On+QBy6J9HkDUwMwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XT6LwcXbuhmmeYJfXzH8Uj7r3ToO4qnI14/eaCmZb8BcNVNTtS9D9BUFjSwb36D01+El8o4tQD6TXqS3y21rCixB2P1crUZcbnA91Y7QmHfP8UmtclGuTsXfUH7HZk0gISlurzEBNiefNDzeCbl3lVBoSUIhtlyXYKaQ+mhw6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bqd7H5+w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZWu9dmm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bqd7H5+w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZWu9dmm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDLN2275977
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/Ic+pdSq/qAyvDsmYaWaFDv8wMS/iilvzlwA+yIGdg=; b=Bqd7H5+wpb86jWit
	nz2VkXT1LmgWhv3AVVdCQq5YhOTLv6vzmzuxq1AceUPr5ob4x/47iVctxURYYiiS
	l4EE0igY7dArg/GW2I8uvumBi4anySVO9YkeglxFC+xr7mEGt9hWPWKZrsUFMf+D
	nK8WUReWdtPcWnPdBFTLGY4DdujVlUWJ4Eobrv5AP0juBAWKN55yEKkYn2tfCky1
	1Y8UGeyOfm0Zyar3QJbpzUdpIJYiRgLHM7QO/6nVKZzVEY6ZoPUIRvGEKaSJfC9B
	AOU7m5Ak2wmiMTJHYeboJjk48dTPT//aiE20Jn7aXSJjOrsNYprT4FU/zbH6wRE8
	WnoRlg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0apb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 07:45:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8486ffba174so229449b3a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 00:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879116; x=1785483916; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/Ic+pdSq/qAyvDsmYaWaFDv8wMS/iilvzlwA+yIGdg=;
        b=JZWu9dmmYF+JedtFqEdM/UzXbiUgPZYxJd9jlGLnB+sBqbYmb6lYnUijSl3esiS0M7
         L/MzKbFBdyng8v1mMK67z1l5owuW91hNMGzCPTlMlD2ZZgoAoJIaIWci28vQyWAhHWYA
         NUb5REYrC/wV6fSEn2j+O35F5jZQOQaokLuesIkGT3NahiCE4u7swIrClQodlJFHJIts
         DiDsDrTWVTxd/Ok1KLPAjpCFKVZK9fATANoP0VRnnJkzcVsKRpthdDK5CNQ+Lk2B32qJ
         swzACMSJ2fJuzhR6uOH1OaxqT0TBf8eKpOLzcQJTNFUJtUTKz2PFenLTEQYYef1Tcfs2
         LPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879116; x=1785483916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/Ic+pdSq/qAyvDsmYaWaFDv8wMS/iilvzlwA+yIGdg=;
        b=k88ETC7CKLTnHmEGeVQY1hi0tb+Kv1n4cbqoVQLaLmN9IpFU+RKXopB/A/ALKsqOwZ
         bXUWEnT9mEBqfT1WQqMh43K1h9lrnfgisilbkzuHbPmGAL30kZAQzZkdvvJom4yCXD5I
         uAbDq/CMa+hI2DLRTBfjWxQ1BCjrGg3awmzqepdS2A4nhaUepJOkG5cDpkQHbZyiTa6i
         qCBEgdJMPn0utbdaql6iO5lFgDIbUKQsw9HRTmveW7PLLcUVF9ZALWUcYOk4WHFuwOaw
         EPiLufU8ueNP6H1pvytGGcX3hIC23kCZUpWbiZtHobnTO9m1CaCbAlTvY0XePt20tVpx
         gNnQ==
X-Gm-Message-State: AOJu0Yw9AxaHDs0UXm47OZ9kiT2I25sOOMZJmSeCyIP1np9XyNl610PW
	nXBBIMbpdRyR03KTD5ps+Z388FxZJ+OkDECqm5KNPPChUXZR3aItSpp9rZNEELOV+J0JSyIV0yy
	lD3uqcGDtaqnBTV3uQ3plT2f/n0hySuvCaIkdFisCbb8XKmBxJBYjeMHCmxdp/sIaq3U1Ps3mHl
	c08ok=
X-Gm-Gg: AR+sD11TiYtqq/Ca8WWaC/u2i1xqMO+d45uQUAUNGElKX3ziQ7TJAFdBJfb9t+TB0Lz
	ZlPikeUCvVefzcpOxI+vPWPQIOSgopUEOf7RjzS84q63b3zTnfeuuhCsuDUCD6JcbRDzmVjAf8Y
	+/1Noo6cujU7THBrvuNnvPfFigJsVgOl4RyQ+uJNtTYnqVwR43rmLsdorZ/cd7Al1KmODN2Jda4
	ocmLLGWUrUOviPrB/v171tHTo2YnlJLnY3rQHxPYIYlqM4oFoNuIxBNjpA1svK3C+j7daAMMi+K
	U6bbYu9vGzPMrjdRmOv/DkNnydRgXC0QvmYu3UtYJSDHKK/ccAksMqp0Th0kTsAeQ93fqKmR3WM
	yA8Ok8dxmuFsZbxAo3jrkV70biE0=
X-Received: by 2002:a05:6a00:1f1a:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84e2b8688b1mr7264418b3a.21.1784879116421;
        Fri, 24 Jul 2026 00:45:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f1a:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84e2b8688b1mr7264390b3a.21.1784879116032;
        Fri, 24 Jul 2026 00:45:16 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17285662sm4224262b3a.20.2026.07.24.00.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 00:45:15 -0700 (PDT)
Message-ID: <cfa3e3a1-38d8-4a6b-a641-4c51a1de89e3@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:15:12 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
 <20260723161435.C5C891F000E9@smtp.kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260723161435.C5C891F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vODcDaHbGIJfzQrm03ftTD-i7Vp-OwFF
X-Proofpoint-GUID: vODcDaHbGIJfzQrm03ftTD-i7Vp-OwFF
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a63180d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j0hzxEU4WLZdmYHecckA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX38vpj6bVwqRF
 Sdn8JJeu1nYwhtdyIn8gFNCXi7PbislGH5UkulQ7Js0p9x1EUd/uuh6jzMwrGjnwSjghHlf8/6F
 Ye3ZQALQtyUfAz+dkjAmfDjCivSc9hCo7hamHhrNYCisFYptFz4Kcd4x4u2zkoGGulnPfBXF5uT
 zBCgMgvb8G1DNxUSSCZ/reyprw6bHG9BpBYYGmgU0zF8z6CNYqQTBHPlBCJOJIkivwlGRhkaQLY
 xRqj1A2fQxoHb+hNt3e4/vyqVJbWDiTqbuEsYt2aefEcLbbQbywoW5ypvs/rZJGr+BlqDWiVDCc
 vLAboV/zzPWtfK8hWQoBjKV/2oMShGEdbQYkdHJE1jYr51ampNLKoKk7g/GCNtwfZObB9Y1o/TA
 2bKVVpSUBHjylGPaadU0BUEBXCuJRnydvZON9BIN+R5YJY2UyFILmYtZVEJNl08q0+VdBSElYiS
 H5tIG4915gci0VXSDtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX2EGpaHvNw2Vm
 FBRMpJI7lGahNyQAynnawvA/GK/Y3d+x0jQdlPxriJMnRoqNaehhVOYuTt1X2yupupW5a7z4+A7
 qJNgLAKoyXR3N/q9qz4cfcH7chqFliQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240069



On 23-07-2026 09:44 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `audio_core_cc_shikra_probe` function does not validate the return value of `device_get_match_data()`, leading to a NULL pointer dereference.
> --
> 
> --- Patch [3]: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC ---
> commit de62912fa52410c163e6ab3071a5cbf9cc2887aa
> Author: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
> 
> This commit adds support for the Audio Core Clock Controller (AUDIOCORECC)
> and Audio Core CSR resets on the Qualcomm Shikra SoC.
> 
>> diff --git a/drivers/clk/qcom/audiocorecc-shikra.c b/drivers/clk/qcom/audiocorecc-shikra.c
>> new file mode 100644
>> index 0000000000000..76017240f7684
>> --- /dev/null
>> +++ b/drivers/clk/qcom/audiocorecc-shikra.c
> [ ... ]
>> +static int audio_core_cc_shikra_probe(struct platform_device *pdev)
>> +{
>> +	const struct qcom_cc_desc *desc;
>> +
>> +	desc = device_get_match_data(&pdev->dev);
>> +
>> +	return qcom_cc_probe(pdev, desc);
> 
> [Severity: High]
> Can this result in a NULL pointer dereference? If the driver is bound to a
> device via the driver_override sysfs attribute, device_get_match_data()
> will return NULL because the OF match fails.
> 
> The NULL desc pointer is then passed unchecked to qcom_cc_probe(), which
> calls qcom_cc_map(pdev, desc), leading to a dereference of desc->config.
> 
> Should there be a NULL check for desc before passing it to qcom_cc_probe()?
> 

Yes, will add NULL check to handle this.

Thanks,
Imran

>> +}
>> +
>> +static struct platform_driver audio_core_cc_shikra_driver = {
> [ ... ]
> 

