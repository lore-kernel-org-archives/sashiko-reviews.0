Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF262F8EBF
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659445; cv=none; b=XbAFBd+58zkzBbCgiMd2IO3cShdkkRHiOTGfPsoDmEW5jiHoZ8iGXuyVanjnxILm5KVSkgbjRj49Bvvvsu9IHSSUEjVtNf72yhaUZp+/eny/62iPrEK0cayJv8eI3FJqAdAvZoXaTRZcg1Qfg8QmiBw1dZeCDD0FmM1+7Sby3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659445; c=relaxed/simple;
	bh=hyAdsxHoCmcxUOb4mhFfepOiXGzQmQF9yGDLT17wCGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TU2cNN2JjozKtIEDLr2hdFfLmwUIgsSSwIkBup8QAhhUPFTOwZ2hQNTnqs5lYAs4/ARFiQJM0rJb0Nkn9C6YDvjV6Hzagzuy1Oapmvx6109+VCWk4P7jY55WNHP/OkK7HbfvkVJ2puAJtmNKo1Z4JIrK60OS+5OgJD21cfi4iw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azz6523I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBBPOefR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azz6523I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBBPOefR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727mL1Q1403482
	for <sashiko-reviews@lists.linux.dev>; Sun, 2 Aug 2026 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyAdsxHoCmcxUOb4mhFfepOiXGzQmQF9yGDLT17wCGk=; b=azz6523IdKYvm+PY
	s+AxcWLjtxJWC5jAlRWX+z4L1OdsV50oh1xUD6YCt1z771WWePs5YtQIcJKmJBdS
	2kswLEsl1JLCY/8TCA3noIJ6e3nXnXm9LcmMi/EkgRuYebtf7ocY0GdLp8NppMjE
	wE3f8kQZZm0anag6bWrtZDX/XhHXKvV+sSPlquu8OZ7KpfDUkpNb0uNgo0mjhZaW
	WzzaP5wE2Mo2DLgeqhXyecNtVs+SoOozdK+UOoQHZzI8St0uzpQnpvINeTJYuA7s
	/Yiy8hHMaorpDWjPmILBQG3aR1oyUjhOCiSScW/HuAwlsQpdkSilywplYLWl01/T
	qFf6ew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q52htr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 08:30:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so49519271cf.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 01:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785659442; x=1786264242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyAdsxHoCmcxUOb4mhFfepOiXGzQmQF9yGDLT17wCGk=;
        b=SBBPOefRLI6rvCAF4VJLgE4zoRwl+ALetB687j+qA1ybU/CJhmnyLskeaN9Na/waUa
         Ixn6WAu/5wMIAZeqSBibps9FzkmaDTCE5Zz0muPRvDTFAj+l1yiS9I0srJvJiyBXiF3u
         9RfimCMi8YZBZ7bouIB3HMKLvSRKt0tNvk3ICElLf+PY/YkXZGsWMeA3aCUKRXCxiAT7
         AlfWIkmNIqjoKKJQKbAWiKPuj4f5i/v2rIoQ8Qp3bEpSOBbSPS9UZslr85zF4CKg6K/h
         i6WeaYX8lf+u2C178esjEmoMVZe0qUl5S6WMkj1mZvQtxLFmUq/aKEEs8LbuvnzoFHr/
         pu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659442; x=1786264242;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyAdsxHoCmcxUOb4mhFfepOiXGzQmQF9yGDLT17wCGk=;
        b=WPsjlOB8aRq5FM+mTMMTYPf898RcnDGAybbvEJVWeT0YoLPLe3ZfCH8NZ+7sd7l1VU
         30RnT6ftw1QL1JzXJ0OjrZjKE+3BmGei4gMT4D2Q5VHXnt57ETmFDf0h0EiP57GUnpP/
         Ahc26SiezsNTCawiBTxdOARrApSjk1pQot+Fi/xaujKWjJE2DcDN0m3i5b5xT1Dg56g3
         cHEAWlDXTlRNv0FhAY4pJogz9wDQHQtPMP1XAcj/6/p5kSfjyLIte4rMF92gKnGC0/Pg
         hnnotRUyfzWNHGm5ahfpb79OTQqWX3mcvS4RoiywbMKE1vG787+ebS7VpOd/rPKM6XQx
         ZqcA==
X-Gm-Message-State: AOJu0YzqNlAlFQilOUP3qXgDRUq4gTOnEm1eoDgJXMRRgv7bNVoh/xIQ
	JdLJp/jGA5/syE2E7DwrmtCxoTfFgG/JYe5/ygrB+ZSUnmtq39TjFed1X2XVvNIcQHvsc6/i1IZ
	YG6EAI0e0cIPkk4csPoiyaJJKvM+zSkZyrMy5/VKj2/xRZ/BXOmBqwc3TPimGDyTV0Xm5Y4RhP/
	998U8=
X-Gm-Gg: AR+sD13bZppIOJAwKxyl1oaWVCpx5rjAZBXFHsLFb5jnuk3F/wWE9geS+BPCnaS6iC4
	hK80D953pzjiz5iwpuwvwFUo91W3eSlRXiLxYyDXRkVyfftL9Def02ohsZYgi/XkbkLLWERGfc9
	c1cX3BxST0m38KBGtMuG97boxO8zUrKShCiKvmoTBxm2LqTn2NA31rNfh+LfGuEONmXL2NBZk1S
	W8r6QrGaHWJbl2L4gAxKoVNEpbOqZrPY0Q7uDc+7s0kYlYUyjftWRHt8lf80PN6s+qyebxSy3Cs
	8OhvaQaP71TXDvdamaINy3IIpQfeb3tMdO9Cp/X1oZcxXzsg5EobAmHt/yBcgJaHigBAVbgwF3l
	gMAz0IJ3fVaj/UYdCCwBCJfARDS96mA==
X-Received: by 2002:ac8:5ccd:0:b0:51c:404:af7a with SMTP id d75a77b69052e-52b567915f2mr124157301cf.31.1785659442356;
        Sun, 02 Aug 2026 01:30:42 -0700 (PDT)
X-Received: by 2002:ac8:5ccd:0:b0:51c:404:af7a with SMTP id d75a77b69052e-52b567915f2mr124156851cf.31.1785659441941;
        Sun, 02 Aug 2026 01:30:41 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm23027051f8f.0.2026.08.02.01.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:30:40 -0700 (PDT)
Message-ID: <fecfa8a3-d57c-4c0e-82ef-9a2c89182e3b@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 10:30:39 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] dtc: dt-check-style: Introduce 'stricter' mode
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-8-b05b8f897670@oss.qualcomm.com>
 <20260726155452.5BC6A1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726155452.5BC6A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA2OSBTYWx0ZWRfX2R6WaRoyP4pP
 ZnRe1SR/pfkUYtrvDtW1PlNpSNjAP8faUaBXDX2ggkO5hYasST+OndvqB9e5mC9Bf2hEbGm5Ilu
 QqNSftdQZtgkQMiEVC6Gnx+OV4QLnzM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA2OSBTYWx0ZWRfXy3eUhmJmgsQn
 am4ep2U9FPQyUMJeVrE2XrSiQnEbyaYgMaJwBDvu2vVRhl2zLKFhL+EmhWBJ2/B+opgx4Khi0XD
 rvDAZkTOifylYtu1ngWAwQbmUrReSOmEAhIAngKsClIivIp7KRAPGaTVKupN0ouBikSny3LKWMl
 AHzaUDVdp7H75+dYW0XMtK0pHeNcyhlbtrZ6o/QYLlDG/P8O0gCxt11ehpLsmjpVqUyqKhujmWx
 Fbv++jHyvgIPbpxOYDlzmVI8x1w0lyQKs0qSCDWawmtWmfX4OsZxRmfOkRUK+JBE8GS6ToODUoW
 4DYcm1Q6hfiP+cY/dWYvfuTfyaap57fj9JQZ5AKxSyGvAOO+gPI4WAZh+zZdoicFMhoaU8r6pbk
 6tnsxjX5YYObnrnAbYrNI9SlGs3xXz9eS0dwweUo/tTXA3AnEWHcvGZ/MxE4eXvAgqy/ouHdTVp
 jaKnquSTeG/sE+GU9MA==
X-Proofpoint-GUID: QE6gKTNR0YFuzZfH5ZbAWf2hKDPjpt6L
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6f0032 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=2E1vlt1IBdFnViGJDXcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: QE6gKTNR0YFuzZfH5ZbAWf2hKDPjpt6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020069

On 26/07/2026 17:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Missing trailing commas in `applies_to` arguments cause them to be evaluated as strings instead of tuples, breaking the `--list-rules` output formatting.
> - [Low] Misleading documentation for `Rule.mode` claims dictionary support, which would crash the script.
> - [Low] Copy-paste error in the header comment of the `dts-line-length.dts` test fixture.

Ack all three.


Best regards,
Krzysztof
