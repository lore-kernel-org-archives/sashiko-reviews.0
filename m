Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA9D2D3225
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785673394; cv=none; b=MHk8G/RkMxp2NJDocZQFl8lpQ6C5S4GNQ2QmEr5GR1NrCDhjgdVhBqobwiI2WscM/9DI5wDd7Pmf/dfGSCMDa/uI/sf8mEmgZQA6Od1JwdhOeA6rkDD3sX71y78lO21czc01M6KOlR2nd3i8PyY5UsW0cYTAWDbXMTz7RwEJuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785673394; c=relaxed/simple;
	bh=d3G6fsvDUyd8a7cHHoUgKbY30Ow19+QKBIZ/+G1/JEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qioeDe5ADEt7FT0CXXc//w2SE2rUyE+o56D1vut4ptSP34cqeXTn63V5C/C8pPRo7sE+ybLt4GvwZ7jQiqX7NDHPoZaiJugUXgt3l9JkXJuKPjFLgNAutihZaxEGqUKQBOLig8VTR5X7NGeRgSIYUn99lBWjsOoQiY14NDxkD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEO68Eab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6hRs6F1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEO68Eab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6hRs6F1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B8okb1795705
	for <sashiko-reviews@lists.linux.dev>; Sun, 2 Aug 2026 12:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQvj2LJvSJB3wwrm1d7BO2g4S6Yh/osTIAKw/KwsSn8=; b=GEO68EabEO40xypi
	3RDaP0GYuEZPwY965JPsjwlR5K3XSfejlRAi5tOiIIAINK/eEMAMfm5NaCBqezFK
	R335yG8PMcO7ASkoztcqb9qcByG0blHBQ/uB+YdizJ7sLJjnOw3/CFFTKOvDZAkd
	JwVtXLLNY8PUndJ5ItcJkXmX6zrESQLLiC+Cnw+h79bPXklIcLn1aesyDRCa1Cp6
	KpHKwvhIy+ol6Q/7TKwuZywGG/vKGHb4U/ibCzjkvihBED6KvwN51A+W9OorZn5t
	d882U2jW1tXji8iFObiwlty+xXCxI8NQDeMKhU9HTltjRhKF14ah5QK4ARUgl03M
	lgDKuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx2ufy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 12:23:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934979ee9f1so193233185a.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785673391; x=1786278191; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQvj2LJvSJB3wwrm1d7BO2g4S6Yh/osTIAKw/KwsSn8=;
        b=Z6hRs6F16VgjVgLIoQAd3nbHG87ggbd3AZVNIbSfjHmPmWL3Jrbl92KBM9gtpSkFUL
         6zNVLoxW8AWxg0y9jayiEgZdIwT80qyXdi0LFYzzZyHN0C3n2nXAs8hIWx9lVgpmxQMz
         mM81ucLIgoRdGtRSOtVAq1d4JTwdr64H7MHdb2hsZWpdjUNo1DSpPJFHyR9/drHxdD3y
         fTuh+UKKOBaSFG0uk1yhuks1HRKvLHIjz6t7iU9m6gpZzch811/rnldpy5XhfbOKD39C
         RLCwpLIN+d9tWmWOycis2zKMv0Nga3nGBQY/yPM9USTVekpilZ+2UAGbNLpUxRme1uGs
         pp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785673391; x=1786278191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQvj2LJvSJB3wwrm1d7BO2g4S6Yh/osTIAKw/KwsSn8=;
        b=OKd1q+cljLqmH/pTx8iDKpmsTbwMXp8eASOf+yDefFmCyvM2g3Tevx1a+w+mUx1ZlK
         koElAK6RDNhJtDgBxPHWlK9PGKPXBB0MGsANfskow4N8J44y7nHQ4Zndod4bGjLw6Bgf
         g13VOay568faNU1JsyENDEgZeiSOt9Z/paPn+U0h6FF18auOpMa3/VbRazop7N6mOMul
         qageDjTrCevA9tp5gUSymKQDTWlXUiyQy+hhM0iRXJ/nXpqVZkTs+w/vBE/TVXF6nelu
         jyy9DDWPkAII1B1HezbKlwNgHuOAvIMqKcajLw/DqlmtZmC8ollhOR/ls5lK2FEnTux2
         ifyw==
X-Gm-Message-State: AOJu0YxTBVjV3rXPK9C9AdGUKRVLkkyt+wnIJZB8nSeqx/XeGSAA/wot
	7XGxvHVNrsgudjJST3yetmyO0vMvKscMqavpfRPS8ZqD3Ic9Kso0F+cOb1H7W0BnRCgrl1ND3BU
	30RQB3sJEQDlnSooogFdBLauj/tm9OUaO+Cnulk+WT+YPSLr1P0APc9KI/V8nCJYlNystIfl1mG
	8ssGY=
X-Gm-Gg: AR+sD10rATJIUGOlceNktu+ioy3vdVcJXtljTzGKjiRET7+Vx1wJsMvTUTyeNppKYzT
	2shi/InUI2oNO0hzJ0J/B7RK1fpAydkmc/HST0qQ+8hupXQVU+tNHMs9r716e/FTKchsIGOVVQL
	eBxqnO8hPBDtYLGCkh7p8PnM4ogP4sJqVWcxX7xFtz/rZh2dzelz6jk3Oq9Q/0HCT01UuSwAyzV
	Me7wiwo3xUTqp/ZEiMOpDh1/XuTkATuSC3sYQ3UOMqoJd80deqMFq9tPlQ0pS2TVrMG1ofPrw7q
	5UyLCDLh5Rd1f87ue0qkfZ2CnK/ON8tr//1gLxkU/Jw11BMaI7b3qChWKwwFeEi4ShCGvky9wCP
	z3W1io+sosT6mBfoRU6uubiDj7KyDzw==
X-Received: by 2002:a05:622a:c87:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-52b5674e736mr131790761cf.24.1785673391156;
        Sun, 02 Aug 2026 05:23:11 -0700 (PDT)
X-Received: by 2002:a05:622a:c87:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-52b5674e736mr131790241cf.24.1785673390737;
        Sun, 02 Aug 2026 05:23:10 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm129502085e9.4.2026.08.02.05.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:23:08 -0700 (PDT)
Message-ID: <23465ccb-37c7-4cf8-b143-42913ebd8bff@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:23:06 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] dtc: dt-check-style: Add test for trailing
 white-space in DTS
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-9-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802085153.E15A11F00AC4@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802085153.E15A11F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEwOCBTYWx0ZWRfX0O1Su9f7KBkF
 HRkDH+ALG2DxtkZ5cEvAs7d4C8l0M8eDgkXzSUkLa1Y0hCXyj0pP/jyvRIxrjsytBQZTcJYi+Vi
 eiSKxEegqXA5tWs2eZdAoEWaVPOJwYGabzCHg9KkDXw3kRqGIpvVQ6SUfyQBLCcqoEffucrel0t
 MLr7zBhjTaG/sr8j9j7TT1XgJ4O8VP1JVwb54OZHg1lHTyUMRt3BFaoEpY5u7LrsMm2X3Ry8p1C
 9WImgtvvrRF40tgriOMdLWm2zyNcZCwB9dWZBCEGNysh/U1pAE1XIo+VcrZDQa+qlWURjlAXg6O
 Sxu0kHVpbdlyytOjFWXr1Ig8oh+tJWQCyjCE9Vcc44ej1lNHN7WOXlj2K7nG3Dm/1j9Z7+uodWq
 l/g2PeSxcul30m6iAizwzxJJ4Ntry1km31XBrk//oUSpGZAWe2D61Y5bfHeCXkbACcOuX6/Ouf8
 Qq2LQxlPH7AQCXRyUsg==
X-Proofpoint-GUID: TdFa1k_xsuyUv4UYec_WV-DjoFvlY7qF
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6f36af cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=SkIldjUxJnNfoXcuKiEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEwOCBTYWx0ZWRfX/Z5O/eqo2eU3
 UUxEgAVHQqWp41Y3pV3sPI371m1xKf0z1zA44/WRxb6CtvOOWF444nBDGnv3r2j5RWz6uWC3UdC
 tuWT3h87DkIthnTlqwOdyDJkgb6NkSc=
X-Proofpoint-ORIG-GUID: TdFa1k_xsuyUv4UYec_WV-DjoFvlY7qF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020108

On 02/08/2026 10:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added test fixture `dts-trailing-ws.dts` lacks the actual trailing whitespace on line 5, causing the `dt-style-selftest` to fail.
> --
> 

False positive, the trailing space is there

Best regards,
Krzysztof
