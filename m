Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9911F2380
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785667834; cv=none; b=L0unhvbhZeCUubz6Ja7lPNTALtfNiV6cX8zaMqfQ8ORAlDR/XgH9vhsMMC6bhgGmd7jeW1apRMkMN9d7tq+CUFCHVhPBuCGKV+JiBUxKxLUeC3bqUo39VH64GluS14wuD8TFoI6PytcdM/YU/RtNkF6uRVJeQMxSMEb7tekIvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785667834; c=relaxed/simple;
	bh=Je6UYPtdW0cJqNgScuEMeybL+cKO3QLfoQtPD+y+9e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjIgAw1IbUnrCmwDm0yTt9OXe6obf4gEqZgdcU5He4bNgj7hFOavgZD8hby2w2CYVx4Ut4sKws9OoPzg43o1B9fqkTS8/pPzO0ioiL8ARd0+c97h5Oy+EOMJBbPZWlkv2o/qvjAYWWfXZaF53vIa5hzSIsCgNlNPzP/rosVCI2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4L0rA3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzKCt5Gl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4L0rA3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzKCt5Gl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727lqLF532204
	for <sashiko-reviews@lists.linux.dev>; Sun, 2 Aug 2026 10:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Je6UYPtdW0cJqNgScuEMeybL+cKO3QLfoQtPD+y+9e4=; b=g4L0rA3oi6mKy1RK
	TOfWsX1NIYnPa+UgPkVTm+N1eFzO1S8y9fAhGZ3qFfPutHu9Lkbtn8L+pHtwoWac
	hBvXLZHPZYOuzykvsDtzghDEAMBJ031bFy93hEl6X91wgMR3rvCubK3xaHulTBbv
	a0E2MGCRbEm6ATWtlhWYpZvYZSL3gTW7eY+qVZazfME5Q0DHPBb/G0TJjz2aSgpC
	yQWE4cp60WgEuEOhkJ7DHsXUqnTxGYt2QBCO9CerF8wpxP3+9xVwzbwLgsVctTmR
	5j+U4C+miOcqsfEw77hS13OwU6plIVLgO7c0GOli4UbfXbPO+eP3qBt904pb9uDH
	ARYwAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9ygjg8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 10:50:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so235890485a.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785667832; x=1786272632; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Je6UYPtdW0cJqNgScuEMeybL+cKO3QLfoQtPD+y+9e4=;
        b=MzKCt5Glb8V3iR6E1EpYwd5tc7T2m4hwXhnkEcEvn4jKylc/Y7mo1u7alRsYBWKVve
         WQgF6OV0tIe0OOzS4g3pr5tojL4EXXqK0sha2HR6iXFoWkQ4+BhGvpxkLA4XvS9Coq6f
         AK6R3G5DATaDAPYBQbF5mPg0+JHgmOMxHkIZRnDGclmAR6B2C10gB8KO3eP3/IZMD5gu
         vkb3DnhxCn/t5oxTP1+MplfGSTF1eZolt/BF2WrgI+/Me2V60EC6w5SiVmYjMVXhGdkr
         SetwsxPHD1dtW28XBOTpUzkhZkPRMoR1k3VqmM9EtAu4akw+rs9oXNjcyc19m9b0qWcK
         vc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785667832; x=1786272632;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Je6UYPtdW0cJqNgScuEMeybL+cKO3QLfoQtPD+y+9e4=;
        b=Zq9vVuFPbRNGZBDg59P5vxr/f4UR5ROjtNfLQi8BR+7BPPXH33O6XiRt1WC9ELI4A4
         NQZKPsqyQc2lnJ9VK3AXZnS3ErcIYyCpu6ViqS3cVipt71I1UD+LH0iPGLhx+5jC03Qu
         vjVSpihiGmACwVFd5CrzNeSwAIIYglkJSSQ0yhkE1xwp7wFKA8TM4vfciF6/FmJ7BU/Z
         fomKz6vRtz0mWyVFGtJftMYxDYJxhVJOkIHGhfF641UtvnA4XbGmjTWiFwaChLVYhp1x
         Dstutv5bl/2xBpYkVo00s4ojESj7neVNvvNb4pnWa8ue7wv+db7dfhgu0suRM+xFFT/L
         IvGg==
X-Gm-Message-State: AOJu0YxO7axOf9soLnznKT8gcHLrWZ4MiHEjtV7lhdqhIFKcBWhMRXnC
	fe1BItjmRsUUkxOP+adCYSQzRkvuD6SJ7WutTnGm22HWK+VbJ8G6l8uQFW3tAkdt9zN7fJ+9tzm
	C1Fp7fYHcpOOarzYSLIGUqjKZq+0nrubxmzAymnKVctoYMJs+91IMrFMlkc+6at8oDTBB+MqgpD
	xZF94=
X-Gm-Gg: AR+sD13N77ZbEeMp+1ABrbu+1QsADsb8S9ct3OfMTU0CSbpgxLYKTsbh54FE6UP0GIC
	FLsOF15H+sexd5eMqusNcPx9hXM0WclXTZm2Y0P7aWoap0Nxbjni96dAIO8qfmdZZmuewUdPOOZ
	UYzlj+61EP/5BbHFIq8Z7ohgpwn6ak5mIcMGwPat6ksmdIgpju3Xx6raIhaGfEapgiBHfZ3CDXH
	QRWImvbHSRGL9V3BZ/1mWqQHbgz3xM8fA63KxEutWzdoDAUo7WXZxuDUeUxqbuE7RXrr7gtlXvM
	0vlwtZiT5ZdqzZS8Db3VWlEnolXde/3nimpzG8WLTEgxP1TtQEaya/C/V08f1dlih165WkyEIk3
	NeWrwRphkQPNYUam/Hm5d/KcwllNrwA==
X-Received: by 2002:a05:622a:1e0e:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52b567784cbmr121528811cf.21.1785667831823;
        Sun, 02 Aug 2026 03:50:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0e:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52b567784cbmr121528641cf.21.1785667831358;
        Sun, 02 Aug 2026 03:50:31 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ea4asm22846515f8f.31.2026.08.02.03.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 03:50:29 -0700 (PDT)
Message-ID: <b9496243-3d49-4971-8be8-bc4722a6bfaf@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 12:50:27 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] dtc: dt-check-style: Introduce 'stricter' mode
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-8-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802090622.399B31F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802090622.399B31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA5MiBTYWx0ZWRfX+JOH38ijemTp
 3L/BV6FFRUx6ccc9fa2DMXcUGEyE6ajttlMcBLmv1atpbAnk33uMh/nRFOqqI5siasBjs3nG5rC
 nEQaQg7+KJViFmV4w/MvWiHR+JYwLbY=
X-Proofpoint-GUID: hiv-aPEf94v_4ARUCdBSSlYZNhOCw-Rc
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6f20f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=SvlgPUXKwTKBsf7v8KEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: hiv-aPEf94v_4ARUCdBSSlYZNhOCw-Rc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA5MiBTYWx0ZWRfX7VGcJONqgdJK
 eUHuqgbHegFCU514B6tAAJeP01EBiEehoal92GmfoxdfXcx1HvCh7zQ+erWLQ8SdIo/3rJY16yd
 mqr9Ep1lzo4IiAV7TWITzuny3x2AAZhPQSRzyEsrFX8bTAwPbPT/GQ1vLwFcIboxCuvGB30okFq
 vA7KISbOFgmYYQFuXk9zumJu07b01ro2rbpFU+NyWMZrQtkzKTGQrOv87X3FJbJnp2bk9JMxBgF
 7bXmgDQdhs8v9RXtpcvvlglLGKNQqn3viLauXY/tTCyAo6aAr1t64JSEaX2It6mmYQn2Wpovjwx
 Vw3/aLD8TconQhElrtpzEtwM6Em8NU4CnVecqyacxwFBcJ8GFS/nRcQNp4WnTBBUwJqYhaPm4b1
 fvJqFoMXDx6936IQgVU/kcnGOt2Mj1+/zBWzYr77ouaLvpe1150LpnShdt4rqzIexKann84VbBs
 4jhmo8UT9vXNcIj03+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020092

On 02/08/2026 11:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The selftest runner `scripts/dtc/dt-style-selftest/run.sh` was not updated to test `good/` fixtures against the newly added `stricter` mode.
> --

Ack

Best regards,
Krzysztof
