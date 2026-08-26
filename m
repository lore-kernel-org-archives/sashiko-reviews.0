Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B793D9DBC
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741122; cv=none; b=Xr76xE5xmhuw90kcQUuuYR3yNPyK9RWn50dEaGgbXJa7p8Ap4QgfD2lpG8Nvru7nbxWvMBi1bqQY/qzNPkx8Tfuj+rdBF+4eMRO12fkQQcqMmmKu45kjVelAyNtG3zD9KAvhKiwTlimiGjiQfN1Us7drSa5iJpG+GDZ/xdNUF8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741122; c=relaxed/simple;
	bh=hYhdNw+xBDckePJH1bivK1EXjvy4kvZXDMpqsnfJzqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRenN4q94iAPa2E7rzmGno1KkA93+mnc27Hvb7N9eXPpfP7e0+juPx+RSAySfnJ6WkcrDghZHcW2VG4ntWKIaxhSjByKX6I/VQ2nU8T9PpHTf/7YTptdS+7bhv+HkpRSZJ8SIsxmXMbMgTISZeFYD9jWlvG3hykIri9GErqrGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDg2SUyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlMv/jVk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDg2SUyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlMv/jVk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGeeC121437
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cOsapntm4VaLWqb5Qj3GnsvGzm+rBmPLVb235iEtbo4=; b=PDg2SUyLycn43ZmG
	0vnAZXz+m2gxezToDjRxhb9t0sHSjJnVSVIDc0TNhhBJkJp3ZA5/mv8CeN1z0hbB
	hZpar3GPUCMvE9iDJcOVAftIhMoZFfbQFNhUbBHdcphXq6WR9Co/z8FrtSDjmsOB
	rZyF3giwLSh+ulOSPY+oKXB0UNMFLUso1jWBaJlCzKvHpkK+rNpQzCMqbjZFXMg/
	BJt/Jh7GIK/+E7LNv8yusuoDVxl25VYmBL94oR1LBgFLbUVW2Qj0ddLvrPrgJmBz
	N/ZHcdXT/VapnAy1drE33H8HZDFk0u5SdhAQq4rHyB+ZmKB6zjx5wy67kIhaDrdl
	oAdQUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx9cuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:45:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso11304051cf.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787741115; x=1788345915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOsapntm4VaLWqb5Qj3GnsvGzm+rBmPLVb235iEtbo4=;
        b=YlMv/jVkegMEyAPKO5cwJ3xiEaYInM96N2eMme0MXYwR8Yb2qYgkcNBJ0GHtYIJ339
         2KKMFdEnlFUqE5Ucaw9jpUnmO0+8hd0faN8TzYGCvyD0a4WJkk5YW1jFprEczbJgCzRN
         bLCvmdW1qyagg0iaYx0/5i2fvUazxw++v9RJA/j1tLPj9rAtIJMazOv/wa0wPLxuWuVO
         pVzfX+1FdqQcQXg0P+hjh3WJIjCHgewoExkAXcyHq1bD+LqWmbmW03OXJ7aX2sDNqJsK
         d4U9c7h5fYj3vlCZQRLnisnPbsgm02EAAZOibux8gyf0H8e3IJdwKBYmoUSEXPxE7pbz
         6gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787741115; x=1788345915;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOsapntm4VaLWqb5Qj3GnsvGzm+rBmPLVb235iEtbo4=;
        b=mmi5sAXoMWhn4GA82cccrG1XIEXm0Pcc4C3VQV/q1Squ/lLmYQ14eo8iU2TJXhsDtp
         PPd0nFrji3S5qXtDh/FL3U5p0rTWJzRxjRzlwy68BGe40m6qxp+HdNzH9x0luKz6CRBB
         ZFWitpvkDoRxvgq5M6dt5qkF+5qmSEq3ChllcWROQarl/6vvyFInsmXC9mpEiaKhkAPN
         Wei4XB0A+jjUSPk+fRkjqZHHVuj5OfLRSYiBwLvQfFQZuk3bhKfb8Ex3yjiXqNYS36ht
         sbHcO50PENkU9IJPokva6FTlmVYWiW9vGu6mvjibHagfR1QtMVZqsdTpyNp4BbrZv+Nf
         QAAA==
X-Gm-Message-State: AFuF++m4GApYoTy6ujvCIHZphUKsctF3S9M69P+Bmn1gbI3ZUWz7aZ/V
	jemCrsmLuOq79h8aJzrVFe8OLYKYcbTlsC08cuLm9WVbsa7DY7gBxvay8p/Bee2OGFAYfRGsdgz
	DYBC5hFUf9I3T7wLhmRR7l7skIwTUQetxYfKuhaktRrANRQTi9Ve0JQMUhDsRoKHy8jRtK91MH+
	wa+UE=
X-Gm-Gg: AR+sD13r/wE5AtWAsA3+eT0WC6BHXG8ev782PFVUsgJEy+nwVjoDqdgsHcmDgZ+dCG5
	RlpO3XQhFWFGcXmea4PI+JZKdcEMIz/2EEg9wE2LJPS6bZd7UAlABVxha9ZyQ8jt9FAK9cP5/vl
	+9VTH3nnRRBoHSEmq/cIIrP//9Pzm24Vlpga9di4jV2w4WuLyuV9bgNTgXuPV58Ms46j8A/9yLt
	eiySfEDWgALNXgByIbok/y7NXuBoWv0SgkYui8KPUvYCPtgymFFqi3FOov0JfZVTHnoNGaNEw4k
	ZK6jG9TdtqcumMxt+XoWfmoAF+oLQw+MZf5yLY1ROQX17RY2tqC3EBoZCwaf5pVD85ybc1rr9uq
	AZpAadRHfNsHZWcjYd32Xi0ktPn2Y
X-Received: by 2002:a05:622a:1aa4:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52e4236c9abmr50401021cf.31.1787741115409;
        Wed, 26 Aug 2026 03:45:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa4:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52e4236c9abmr50400461cf.31.1787741114889;
        Wed, 26 Aug 2026 03:45:14 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1afcsm5312421a12.8.2026.08.26.03.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:45:14 -0700 (PDT)
Message-ID: <a8747b70-dce0-4a7f-bcea-6121d6b5168f@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:45:12 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] dtc: dt-check-style: Call
 _strip_strings_and_comments() only once
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-7-fdd16ca6e771@oss.qualcomm.com>
 <20260826103158.D89201F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826103158.D89201F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ec3bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=0WPWf5VlfcFsqQEkId8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VJXlnXBdNzSjAGLXq90T-IfzB67BZnAy
X-Proofpoint-ORIG-GUID: VJXlnXBdNzSjAGLXq90T-IfzB67BZnAy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4OSBTYWx0ZWRfX+6T7in5NH5Z/
 uZG4qRimnhvU5hSbhPl1OfE8v35NzpOT5nL+Eiq6XKJMeLERPuIE8p1ZNdPDhY2rvovh9ZBWyFu
 tK1ABJdCjuuFCnCR2Wevw6733HLOOFZm2duOyxh/WnBYY17JrnOIk5ezjGPK3ZhsqaLG4/BucA/
 Vgt255sZKERDaEUYP7SXYPijKIv8M5M3Pudy/8veBuRa4KVnjX7FiJSxa1CZF2Q2/ssjMqWFUps
 Q0eBQ372ZbK/7PHiwM7s6bPd6GqwP45nPyXX657W8etAU4kmL8CTrYGdZmvU/2H5v52Mj6/fE08
 NEPyI0M+LIx0a9tYU9jwNBrBFmdfRc+fmmR2KiqeTP/5z1uZmWxGUq9piX7QB5Vc41L0o7Pg45n
 Y8bdv7BwKxvR3hZf5M3wE2rdxeCIzh9Dm5fy+bUS8FgTDPqc/TQONZWY18wQjaNJTRQF0gdaBnH
 ByWUQy4+RILFucclNqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4OSBTYWx0ZWRfX48zbRTAIqDls
 qQtuSGjrnTn3XdZy1U/JadYv7m6wKiuzqOSEgSQJJDTpDowkfOhKDVzt0wm48wEs7PiYfu4FkgW
 l0FBUV2adcuID4kKAPwQjSGjQPupFeI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260089

On 26/08/2026 12:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Removal of `.strip()` in check_value_whitespace introduces false positive warnings for extra whitespace.
> --
> 

No practical impact found, but correct comment.

Best regards,
Krzysztof
