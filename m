Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAA49F137
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103921; cv=none; b=CJzk/yRm5t8eYb3bzI+iOs7Cf27jPI0E+ktPuXrvGwUmt6CbbNqpUjGWI2qukkJ0hrfKKeT0DecoWl9I/ORGDovE0/H000cPrn2RCXrvLyCqDpqF1zyrGlKvpaN82TIzstR2XFe2YoGBNYRzW0ZYpCPq4a4xii/VSwHAA6wIVIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103921; c=relaxed/simple;
	bh=Rx3vJs80Db4VF/9M751X88Qb+a1HALVjZDFximEAPW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2vX4S+rHjg8uxM6zhYYOMbzI3B6SZK8ghWAt0mgjHIf9ZkPOqqP7MVuL5t4+B2kUT1kyWdn/Rom3NZ6phglfSaIed8wtZUCDHsCbkM9uGjpuaLVINVa3gVTgzsPVSbwjIDHqGlfQVbz/TOHYXyZO8UfIHX57HZ2cO75a4hJCAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUJuFMrP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QkbTpApL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUJuFMrP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QkbTpApL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6xb72033239
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 19:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ivyrd9+tpvNNomTacj79thI+x6GEdKA0UpWcM4T1+dY=; b=KUJuFMrPz6OZimEq
	AFoq2cpHWCRARNK215an/kRLrOznsCiyhIzJs4DvnDXHxZRPKOp9BDSP4CxcOeBr
	+4rmry467fpWMzBNmtawt3aOvZDJevZMDK05GdYhIv8mMpFI3YZZXmyAldJwntrM
	5aM8PZSumStPSUn0S842xcvZJRh6VDX3gikW9J7GSjrxYuS2wM/5A1A58lndZO2a
	LKUAF80cpJD3Mgy/XV5+e9GAPgAs5Ee24+WRT+dQe2q/c6fC2FlN6G2w36qoPlG9
	wMc0SZRbFQSYERgO4p0o7gOiLQCh+P7E3jzsjxjn8ZaA11zevUo2ezYq5VoH6Sn/
	9/db0Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c0dxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 19:05:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7866c4ed349so143636137.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790103918; x=1790708718; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ivyrd9+tpvNNomTacj79thI+x6GEdKA0UpWcM4T1+dY=;
        b=QkbTpApL0ZDfULYWJYeNa09Zmfjfn1kP6LFBnrunV0PJedJi/AvaI7dD8cpx1NrMUS
         WjTfg7F5eB1PsSfbkzQTefFFPbS+6kHrBxo2UdCcmyr+H86DKotT23ja90Lpe2KUOF7C
         4vTyLHQs8YV0+Ou1d/P4HvbkYm55lj6RJmGdbG4T/hp74rONms3XRJpFtPmwB23hBJGQ
         jD9uY8aq5DWcUmIdjkCnChcepPIHBnROrBr/tiOr+E7JQQXGWVm6fkcozX42qktj37uj
         OwVKAKqfnlLnAn11xTW+oLEisyGcb6b/SA2H0mZKgkkWBihwnMqTdqbHlvexzY11KuEa
         qXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790103918; x=1790708718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ivyrd9+tpvNNomTacj79thI+x6GEdKA0UpWcM4T1+dY=;
        b=vdmaRi+zQOcdqSoTunnIm6VPNXL946EmboP45h3P8LgYQkueCjKBCf0w0WC1AztlBz
         9txDwerXfZGHrjz0N1g/jsbvkSvqCoXgFtErqdAOsJ+JIwyh14lilGi2GpbgBExnMzgw
         PRDZQPc+E54FOkqITYFumOdniPx7fDoVpXSBRISN5qDae4aYrlAbQiF1HqdwWqmtByFU
         RIIkAbMD+TAJm/s0DKAN3tkXsrZ05JePGfqN8F1KHeECDOR5mfvz9vJgw5UM37MHbeer
         iBii/DqkvD6R/QZWVmKwdYxnM+LAQQ+DiAKPfXg2neCWEdwgAc7lQmWdeMA4Z+LEsKQE
         OEvA==
X-Gm-Message-State: AFuF++noXfa50DZpjE0U3zt7PGpJPVRVNGTI9MNg8NT4FkbWKA/UWcUh
	eMrbY60fU6Urd/NnrDoVh2IQvQeFH6XdgvRVtobhmvZHpAm17njWtudJFmezSlK+0e2HuzZLKau
	jAE6xnFcrjsZy0j5jk8DjMKf9+P8ixjt33boxkV/vj7U+6hzTpf4Tj1XbBbxhOjYYQIhM27Bd/T
	Yn2rzI6g==
X-Gm-Gg: AYBFou1rrvlcGbS91pygh39b8wuJnK9nuq1GtETEwhBaSGO+JFr8aksZ4AhSDiFSlOM
	oyvyDUuCEv9ifLND35fRT6phE9UwqxgcOpLqTGttHYdNkKjni2Vu4L8ORJjNwKNK/5TKmUjYEqJ
	3ZRJ5hERkw7LQ/1gLrDyr6v/yHYgGFKSgnGITAlmUrgH8BMse3/nYl1eZkQokZX/dxvxLtdzRZ1
	L6t4mgV99A+o2n2IrjOnuD87Xa0AedvtuB0PEwPqiH4BwpXxt3NQzOV/DbewQYvd9/Moh53B8qb
	UjdcySZeDcCXT8WaEZwEkze3ZYdRPxWmw56HwzGUw7TzvKktutvQLb0ttLPmDaDQilvW9AAYqkW
	WuaGG/arKypqqKvj6rTlFAw2cPUeqxoUobaZAAkxp+DrxUZJoHZJ7qDR9EEKxBJmBnpJJHXPygK
	jP
X-Received: by 2002:a05:6102:80a6:b0:7a7:19aa:8a87 with SMTP id ada2fe7eead31-7ac1d4eac82mr350767137.34.1790103917954;
        Tue, 22 Sep 2026 12:05:17 -0700 (PDT)
X-Received: by 2002:a05:6102:80a6:b0:7a7:19aa:8a87 with SMTP id ada2fe7eead31-7ac1d4eac82mr350719137.34.1790103917504;
        Tue, 22 Sep 2026 12:05:17 -0700 (PDT)
Received: from [10.188.38.210] (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-3a62f505fd2sm1258671fa.17.2026.09.22.12.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 12:05:16 -0700 (PDT)
Message-ID: <bc795351-dcbf-492a-814f-2cb1d009f6bc@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 20:05:15 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for Glymur
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        linux-clk@vger.kernel.org
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260922185449.51A221F000FF@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260922185449.51A221F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4MCBTYWx0ZWRfX3ZatzUP+Eu2S
 68c535LYaJzYgyyvBw0R3zbj4F9Qf8mgGBi5DcQvYN09nO+O+K6rgIJgcdHkoyvWto3UlsQW6/m
 kUxe+5YBYwjVx1P5/Cbft3CNvgLKm5h52hacYqDLt5DLso/oR2rYm1njrO/Q0UR1ZcfB3hFaVz+
 UkuGmHVDNF99IJCN8i+9MabDdQGpYgwmZ9Kx87haU0DgtLTyeb8/qzG/RYodxU8Sl74cJlX+wIz
 HrbV3bqjmHf2cM6/7p5FR7RikeJbzD9WdINq2pFnq583Gx5/RnUMlIZ8u769nt0Qac5sFbBp0Uj
 dWcaRQZCNqaKiZk78GLVB5DUlI7XOg8mhhCHvtBOJ8JXLAuSbMys4lk7LRkIlrR80d+ImZvykPk
 daQQva3eT9QsphAVKw2+uX332ws4PeHEEz8mQltymhAUuClpPEgZ5lVd0riB/1ckTyb+4BFPLk8
 7BsA9MwcIkvmy6bW/RA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2d16e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A6BDbR3q_nxYMsy3TRMA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: sVdM0ry3j4T_9JcafoiAuU9P-QQ_zpXu
X-Proofpoint-GUID: sVdM0ry3j4T_9JcafoiAuU9P-QQ_zpXu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4MCBTYWx0ZWRfX9wDd/nVqYqCd
 yLx18uzBuXKxwUSSm6dKrOqHUpM2zf5ug53zzeTeMEWrLdENzyB3cuO0IITg2goCOcLFoNHbekN
 HoGqNnvDMEpwJFbfRWflYlz6yAvZiX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220280

On 9/22/26 7:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: incorrect `#clock-cells` requirement for reset-only provider
This binding is for  clock controller which also has reset controls

Its pretty much inline with what is done with other lpass audiocc bindings.


--srini
> --
> 
> commit 347d3aed7b27ab7cf248e5a7c46279253cf08e0e
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
> 
> This commit introduces device tree bindings for the LPASS audio clock and
> reset controller on Glymur. It defines the compatible string and required
> properties for the device node.
> 
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
>> new file mode 100644
>> index 0000000000000..c047c0174a93d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
> [ ... ]
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-lpassaudiocc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
> 
> [Severity: Low]
> Since the commit message specifies that the audio clock controller only
> provides reset support when it is under the control of Q6DSP, and zero
> clocks are exported to Linux, should '#clock-cells' be required here?
> 
> Making '#clock-cells' a required property forces device tree authors to
> include an unused, dummy property that incorrectly models the hardware's
> capabilities just to pass DT schema validation. Similar reset-only clock
> controller bindings (e.g., qcom,sm6115-lpasscc.yaml) correctly omit the
> '#clock-cells' property entirely.
> 
>> +  - '#reset-cells'
> 

