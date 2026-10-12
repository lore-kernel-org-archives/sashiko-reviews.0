Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A6472083
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797415; cv=none; b=Af6A64V6iDt3Tgp9aqFDFeelnQuB4r7ADZEEcUA4TMJH/NbfcizSXv+ILKS8vzpaoUIGEXEaVTgLAIpuy+ZXaFeqpAFeLsWKaHBYlLW9Nj7GK4EQnbrEaP3F1myk3d1X1iqE/6Wb/SYNUI10sltYRi6RYv4993dPv+mTVjznzog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797415; c=relaxed/simple;
	bh=nSEDDkMvf0CoQFcM6UdUDxw2hKwIxxKtenAQDFeWcfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3HFuuHBFh3C+ikjDK1c18qAMqzUXmIrUGcqQO+hD69uAu+tvfAvcV1NKhrUYsvbAKy+17kqEghuthYCS8DwSYd5TDgb/ZZazdKVZ5kLzk/X1hodxHNwLvwHKpL55tpFU827zYoY55qu9+tYgevm222tdyGmLY/er4qSbBMRAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrLvWbo7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XULRgVKP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrLvWbo7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XULRgVKP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KcPs1592776
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 09:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ct9Vpo8ZetqKaTi6+3Fm1GsfolL1MvhsjrlhMMlUG7I=; b=KrLvWbo7X5W+Zize
	9wroe5MhzcgpwBGp9+O5CvvuWGnfSXpCBggd/q1zX/j5QxvXUHKXwVUC9ncuedvy
	Z6r4xoxGBwKJfk0hINtl9JZg+J+3J1GgRMaDr4XuI4lM7wxWHUkL3/xXdU0wJ3ll
	Sq7FeUS8TuSBGsQ6IWITrDRwJN5LN1JNZZdNPFxSUEE7Q1SgD0OeocfuA/SSVptC
	4+MMF9sYcdILxyj0zvg9QfpwgBBZaFtwbP7RyTmcBOtm6Fec/Iw+U3lfgMZmiznV
	q4mQ9CIcIDGvmvX6AJNlll/yGah7vGWlO7MgfSByeBSSCUJEbN7hb2cEaOCKxL1W
	KqbqXQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu110n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 09:30:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so929388a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797411; x=1792402211; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ct9Vpo8ZetqKaTi6+3Fm1GsfolL1MvhsjrlhMMlUG7I=;
        b=XULRgVKPfazW4J1OCE+DK4bNFjNTu0ZiNbPu9CXtZC9v0TbU8zhSzu+UzXMRRoQ84G
         G7gqt/DAwjbri+TRH1DOa1aIOWQMuHjLcHwQ7ADZuBnXbZ6mECsw5jYJO+5FGJc2ulsw
         dLvSVKWcbqVvubTkhm15nKRWC/XgwTCYgUvGrMM3UDw59zayuKdpbOFlZJ9kHgPm99Rb
         o8sefKxV6I/0lHaxQKrz9Y2/tNLFBfDYZK8itSjMW2r/rTHS90EpVfNIDIsZWW+kcjUp
         owX8QZlU5X+RiGf93fXXnPPxG7HrKVfakD2wRUV05ZFLw8Na8g10h3Qymyb/0YrurbxS
         w+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797411; x=1792402211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ct9Vpo8ZetqKaTi6+3Fm1GsfolL1MvhsjrlhMMlUG7I=;
        b=NEypwpPJ7Dw2UwvWhqDzihrVjvX6mNFhl2rtpuJ+0njWslRjkebKSyxv8Yj5/cyE8J
         zisWxkGHf2QYtVLDJtK3kssXho8Rv1uMnb3QCOx8ul8Zt+mC95DRBf8zH4/q3PwNP3z5
         OgDLNCWHRoDksVWwDU+H1pQlE0qHDJIqo+B72AepwtkrH3wIbdk4GDpeCIEW53ZzbL1j
         Ktmn+ARxphrBz7fKaJ2k4G0PEeGDXnhnCjVf7x7ON0CNvTZOuNFGqf0g9Y3lXtEXqgy7
         uJvz+pP3+RmYTWyYWO6Z5qG+cHGZJ+pvL35XwwCDGpeh2oWF7OK32NJpbptA1KGXtJZL
         5Bqg==
X-Gm-Message-State: AFq9FYJu4p9RXnWjTpL2hS2HD7PaFdrtbcbEFrvH0l/BdZ6t8CG2an/I
	oKk4QT/1Lpwx7PLrhUt41bb8kTend3YVu83pUCSJLT9Wo3Ql8gTdmLokMaqNekUZl6gCz0Bveaj
	R1vr30iE/Gr60s7iia9hnEb+XdLmu2gvOLOitLyExOEG6FgmDyECM3j/ywGAoBHJPuHKgwXIDgn
	7W/RQ=
X-Gm-Gg: AYBFou3qmwncUwubwLGMXESBU0dU37VzsEWInaH4LovOvuLtxzW9JQxUQR6GcGIMvFp
	+ptvRgQkL8S1bLTrDEystCcp+VVlaq5Z1d8PevUJ57evzwpfZ50cHy84dHOFaoXgZPzpTwtopcO
	UJEDen0iPWEii69OQFHzayNJR/Z3lXiwLN90PupWI1ihSn1/PPeuTNaNKPHb9CC+05Tq3UA1Vwp
	JQ25PeEbkT+IKWnhFzljwEVZwbXLQ4BbNelrrVAjG9qMg/c2SKMiJfHOOk14XFFZpBWK7AJtnrP
	kbx36JPRUqUDtYOEq6TUioqdfhHvHruNOmEgGANY/jwXSgB4v5phX1Tyf6fEpjicDfo5jSOGqQy
	bS4czfhmjz2QX3Y4pem3h6bnRL4PGzK6E/w==
X-Received: by 2002:a17:903:240c:b0:2e8:1ec2:a8c4 with SMTP id d9443c01a7336-2e8428a2092mr67121835ad.14.1791797411292;
        Mon, 12 Oct 2026 02:30:11 -0700 (PDT)
X-Received: by 2002:a17:903:240c:b0:2e8:1ec2:a8c4 with SMTP id d9443c01a7336-2e8428a2092mr67121645ad.14.1791797410751;
        Mon, 12 Oct 2026 02:30:10 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8c6esm39087925ad.61.2026.10.12.02.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:30:10 -0700 (PDT)
Message-ID: <954f820f-63f1-4148-a22e-bd85961c88fe@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:00:06 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 16/17] wifi: ath12k: Resolve userPD ID per device
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-16-2c5797b5e4ac@oss.qualcomm.com>
 <sashiko-outbox-164038@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-164038@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acca8a4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QAkOWx1MTCGqTjxtplQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX38IZN/mih2At
 LJqv5X1tsFyNJ9/X6MN1tPH6dzeEyHkVaN1+FpDHYCjdD+1Kh3xa5JE207Zcyg8+JdoVykJI9Ey
 gXGv4rW5hK2A1+YyOfvWyy0YN7S9cE0pnZg5aZwYsCrWicgZlAWIMsz74RDAWBsSNBXq9LcBDan
 cAceA+M8CFcd5IvyKbJaUq9yPFeHidHM43Q6sE+RkAURdg2Og/y9jnUqRm1jFojp2bvDlNALMRT
 wURqWE2bAHE2nBFakSp4Bls2e9EpxwLpEZPRMQq0Iuz2ZqNegzWc96aISeob1irbpZ2kAgfwvML
 eFpL4e0U6aAUp6cRIXlck8ayFuTzfVRzOyIZFJVhA5kv8JSOVrb8jN22lorWUobZUjBBwjMKUff
 +pClMCE7kHNFXbEzknkqmm4pqZy4jqxlEGXHqmArPoqU6YaGutK+Uem+vxpXmpX4ksQispMpU+t
 UAPYABoA2xf/vCmzTIA==
X-Proofpoint-ORIG-GUID: WOI1gcSndIS5qHruQ2zFU-DoR44ewXsx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX/5nrXtnii1GG
 rPy60rPu3m1LwAphwA8y8FrByYvDKK8FJlnzMISuSLUipp/ChrgFJryWhrB9aZH2X2K0QD5CjNL
 pzo/Yfp21UtdxwMZLV46439G3MTGrTE=
X-Proofpoint-GUID: WOI1gcSndIS5qHruQ2zFU-DoR44ewXsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120037



On 10/8/2026 4:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] style: inefficient NULL check inside resource loop
> --
> 
> commit 1ba3501c64845782d9fd054ea266b2485861b530
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> wifi: ath12k: Resolve userPD ID per device
> 
> This commit resolves the userPD ID based on the device address rather than
> hardcoding it during AHB probe, which is necessary for multi-PD platforms.
> It also sets multi-PD support based on the AHB device descriptor.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
>> index bff48b2fe124d..86359ed1eeb2b 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
> 
> [ ... ]
> 
>> @@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
>>  
>>  MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
>>  
>> +static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
>> +{
>> +	const struct ath12k_ahb_userpd_map *map;
>> +	struct resource *res;
>> +	size_t i;
>> +
>> +	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
>> +		map = &ath12k_wifi7_ahb_userpd_map[i];
>> +
>> +		if (res) {
> 
> [Severity: Low]
> This isn't a bug, but could the NULL check for res be moved outside the loop?
> 
> Since res is retrieved before the loop and does not change during the iteration
> in ath12k_wifi7_ahb_get_userpd_id(), checking it on every pass is redundant.
> Returning early if res is NULL might make this slightly cleaner.
> 

Thanks for the suggestion. I'll move the NULL check outside the loop and return
early if the resource is unavailable.

>> +			if (map->io_start == res->start)
>> +				return map->upd_id;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 

