Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995213;
	b=2JEKd6WbKIy8ZxCS4Gd7sj74HlacHkTEU89A623DnI1qzYwLiROk2BJRbjhXLu4Ytguc
	 EomiSOSpy6JH0LP69GU6cQOWWsN3ZB3w1nfiE61+fwkk4y+j3lohER1sNKv+30i56+LNF
	 sul4YlRbcPYTqpDK6/YWcsbjuoKEStgWqG817CIpuxuZsA3buH3nQZkO6cBJ15QEj496b
	 vNT96fh14PW2XiMKHIJFfE+Y/yFxz2iXMcPqOL1FiAEAnWhU92KebPNtKE7IQy6jVVEkc
	 1zuzuQ/0yy7wMk2Phdpnjds5IP/qcPZS+IpDoI7uEYhDE3fKN+MeApItl+cNaA/tAlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QGFUyamvIl2yJRsbYSWhNWIMz1t3j23zUvCObGtz6cQ=;
	b=2AU2+uj60HznwBL1ghv5795lszXnnFVMcHs1H2sFKo+Htt6WbbQSkLZVxvHGfwAwWxCS
	 ZtimsoT0nUpCL/PyucbWyNOTT9kLVjenbl8vHsBFLPrR2q9BP+7/xaT77ZG89gPgjETn9
	 YZfnFWwQQZ/W2M8qjmQ1J66k/8tZ61/EB2nP2PM5ESuf32wM3CeNItrHr7VdX5gtoBwVA
	 +dQbhD0MbefmTE8rIFDrMpIuePiyB01vg9sQc2AFJLnWTd4EqHOP2cP1hEyJN8Qt5EFTq
	 GW+00CtnXVXuh/wy4YHOmUi+DUJggU9t1wTwMyA2+c87QZxQ9nT1C4lUTAfluGjlrUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyI11t28;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZh+0vS1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6E7606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 09:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C6E7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyI11t28;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZh+0vS1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kEh1143672
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 09:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGFUyamvIl2yJRsbYSWhNWIMz1t3j23zUvCObGtz6cQ=; b=IyI11t28fN4HBTr9
	qINYBmOuGTmdnvFb4xOCmmd1a1+3c8F0FOXkpznPEfC+GlorLrAEQ6wVjZF/LoNm
	QzhVRB/4L/lhSwRLge97aXpyEZbrOOEbycd90OmWumsCAM0cXnxC6qNK4HM5Iyvt
	03mmdN4kTU2FBUJkgcno0AETEIL6TtkMSR7BbwYmqSebbyNsKZijBoLptmHJDbQq
	mAhB45p/bz/fIT5OjCLPFINCZ36Sd+FTPCVTqJJpdNLHZfA4A+1gNRMwbnwoxqJP
	cvDHU/JGozTDluFkHYN5bNTMnvBZ/YwWcHvwP7NZjUSE3SE6FIZRF8wzCOzVlxg3
	Cgwuzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8tbx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 09:46:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso649529a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 01:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995211; x=1795600011; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGFUyamvIl2yJRsbYSWhNWIMz1t3j23zUvCObGtz6cQ=;
        b=cZh+0vS1+M9rv+TFKoNzvxoDAT1Rx68GAsonQ3p251ieGJmaY4C7AcktyCmb1TYb3T
         pBbm+4vgJKNdzxUQX7VuOkg5VElrXmPE9lBTvlHsIWZ/dwZjctXDXdiOdEITkKtP6lHU
         XujTaVW8j6Zmd0U+GKUU/RO1kjpsUkkmc0Qw6FT7wJ83D3URMq902A8Gdaz0rLPRv1/7
         K1WZTyhNqbrHNvF/4br/kiF1C6Y/fSo9KRXZ6gIdagTY45hr1KfK54b328Yqr/MjJQtX
         VT2WakiF0p0hUizjuptDHoNjiozEHXGSvvF6/oVMAeIlCBMYjbTsVbtqCLxIIqjHz1lw
         1lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995211; x=1795600011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGFUyamvIl2yJRsbYSWhNWIMz1t3j23zUvCObGtz6cQ=;
        b=b/eS7dC/obfdByfK5p3aFqH1oGLP/dt/rmzcKLs+LX/uQWIcHLZTRWihUMiCUfXJJI
         bsxna3QN7TY4Eq76608M7QD1posiqDlNqxAl9Us6+yicnsjFm5P6BxvOgMuBPXm7P4/b
         vzllMS+nJvYLYt7iIOgrEH3RhAszffS/wienvU3h477esvs+8y1CkrHVfLTz9XxGZ0kl
         kukDRaGbw0kjWQa1eZ+43NU2OSU1YlH/54FYJPPCmSQ4YOaijaTd2qdDZE9YuurgqGc/
         SajWBHZYNmib+N6jas4Y8AEv+wBhDyL0fSaQ3RP6cCUQt0DIpQEZzbfnugFhdJ5AQbj/
         qrqQ==
X-Gm-Message-State: APuU4Z+05CO0hCmGQi1OW3ltMx1q2RD32h51ABYeA6vPB8QasIPca2cf
	8i3J4A4hqo425IhEK6STEsniuqxrnJPtRBrkK/tHNcaYfZj/hOlAdwX4jx4rvInUa0O/aIveUas
	BGoWXfiXY6dhmVDEAv4kvtg5HzlAlU0y6SR1bgGNz+oQ4njoXZrSY28Q1e+G0e3dSrafdKKCXp6
	rPyWwU+g==
X-Gm-Gg: AZFdTZeyGuQFrxK4lpI7jTkKbU/66ZfCv9/WaDo8JgiWxL3PS9OAsik4f2x+Bi3Sx1O
	tNeNNQ+4DMz6lMbJnMr9ksw2ALK9sxSqRnhFcCso6h1pezdaMVxIJy/nU2I1q+eedBTL9Kdp93s
	2VXPP8sqfTu+tpM4vpP0lV2bOBq1R/eC1JH7W9H+bTMZgm+EYb2uysifLhsWJokO8jgcFY66BiT
	THJ7d86bM1DLuPriaP+P4Jlok2Y5l9NjkF8z6chcgeTzca0HZclWKrpvIr2wLoAZPjEtmC4Di2S
	E33aDNX6uaY16UAM3xNOdp4mMfLrjsElEsZVovL+20nyJAaloMkiBbtJ4WElt2VGVZ6StyCbOx2
	7RIIiIGppZUqWum9895Xm6d+H0ziN9a6Ei5LX7iawzXbwNdLaoOZOixgQz4KCjOZO8oLIzOu00x
	4cWpWCSwo2ljWslN49klnyKVk77z9iq0aL4DNh
X-Received: by 2002:a17:90b:4fc1:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b3d07b9008mr1957492a91.27.1794995210621;
        Wed, 18 Nov 2026 01:46:50 -0800 (PST)
X-Received: by 2002:a17:90b:4fc1:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b3d07b9008mr1957467a91.27.1794995209924;
        Wed, 18 Nov 2026 01:46:49 -0800 (PST)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03df9sm3576852a91.16.2026.11.18.01.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 01:46:49 -0800 (PST)
Message-ID: <2ace0e0a-6710-4551-95e1-0524ff8d3681@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:46:47 +0800
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
Subject: Re: [PATCH v23 7/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-7-67fd9db6bc0e@oss.qualcomm.com>
 <sashiko-outbox-220466@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-220466@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd740b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K0rlx_LeU6MIbl2n6VwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: rNG0iRqWPZhn0tDmXYbFjA77W34hSSxF
X-Proofpoint-ORIG-GUID: rNG0iRqWPZhn0tDmXYbFjA77W34hSSxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX2Daw3jCDx66o
 PURwePnfSTFxUZpXiNgRYiajPJGPkUtZBGZ9C9VNxx1z+sNG7ZVsU/rO7bScgu1isfyCLHT75hd
 A87yiIQXjU2gMUziunVHz8zZVFQW7WuYMxpRMEeiSTdavIRZPzj88JGfIEX3u98dfxz8Xda/Iyv
 EfweRTStvuI2fLUEp+wqjfNcgKERT3PxoqlosQQYGOGWU8A7JoRGxdN8cgKdzzCYXI2r7YnklTh
 QF23BkKrhanTWpf/INnmws0a2V520kS7p4+QmbR+a9oro5kS6IDtfyNiT3rDcySkG4ck6dePPPc
 RW8il0+fk6bTAnICsak5FTfsdak8qwz0Vn4p2tstCrFqhg1C+VlVCjxxP9XFVZAvWTl0+ADKEAI
 gPtzZBRw/ddl781Lz0K44b5Q48b45ki081DyrnVlBPe4q6GytSG6R9Ww2+ee9VQvBo6Z18U5UJK
 31uJuLjR0d/NYVALJBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX4c3uy+GFXyqK
 qROUqyflHaG4geHUSQtSerihgo+1y/CnrilN3us+6QjlykjheYIaA5az6sDmjc4cQaVOCyB3GKB
 kBmuTtIrvF0uedDftHFSQ91MjiEbkyk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180038



On 11/18/2026 4:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential
> issues to consider:
> - [Medium] coresight: ctcu: premature release of read_lock in
>    tmc_byte_cntr_get_data()

read_lock not affected the tmc_read.

> - [Medium] coresight: ctcu: use-after-free on buf_node in
>    tmc_byte_cntr_get_data()

looks valid, will check.

> - [Medium] coresight: ctcu: byte_cntr_data->enable leaked on generic
>    read fallback

looks valid, will check.

> - [Medium] coresight: ctcu: unordered enable and removing stores in
>    ctcu_platform_remove()

looks valid, will check.

> - [Medium] coresight: ctcu: UAF race between byte_cntr_sysfs_ops and
>    CTCU teardown

looks possible but window is very small.

> - [Medium] coresight: tmc: tmc_read() converts byte-cntr negative errors
>    into EOF

leave as-is.

> - [Low] coresight: ctcu: race in tmc_read_unprepare_byte_cntr() skips
>    byte-cntr start

looks valid, will check.

Thanks,
Jie

> --
> 
> commit e2d99652345f219b25f03926606cfb55a2d0509a
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> coresight: ctcu: enable byte-cntr for TMC ETR devices
> 
> This commit enables the CTCU byte-counter interrupt mechanism to transfer
> trace data from switched ETR buffers to userspace while the ETR continues
> tracing.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> new file mode 100644
>> index 0000000000000..688fe6342c042
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> @@ -0,0 +1,465 @@
> 
> [ ... ]
> 
>> +static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
>> +				      size_t len, char **bufpp)
>> +{
>> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
>> +	struct device *dev = &etr_drvdata->csdev->dev;
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	struct etr_buf *sysfs_buf;
>> +	atomic_t *irq_cnt;
>> +	ssize_t actual;
>> +	int ret;
>> +
>> +	/* No byte-cntr read session, let the caller use the generic read */
>> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
>> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
>> +	    !byte_cntr_data->reading)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * A zero-length read must not be treated as the end of the buffer,
>> +	 * otherwise the unread data of the current buffer would be dropped.
>> +	 */
>> +	if (!len)
>> +		return 0;
>> +
>> +	/*
>> +	 * Multiple readers of one file descriptor can't get a meaningful trace
>> +	 * sequence, serialize them to protect the buf_node.
>> +	 */
>> +	ACQUIRE(mutex_intr, read_guard)(&byte_cntr_data->read_lock);
>> +	ret = ACQUIRE_ERR(mutex_intr, &read_guard);
>> +	if (ret)
>> +		return ret;
> 
> [ ... ]
> 
>> +	pos = byte_cntr_data->buf_node->pos;
>> +	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
>> +	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
>> +	if (actual <= 0) {
>> +		/* Reset buf_node upon reading is finished or failed */
>> +		byte_cntr_data->buf_node->reading = false;
>> +		byte_cntr_data->buf_node = NULL;
>> +
>> +		/*
>> +		 * Nothing in the buffer, waiting for the next buffer
>> +		 * to be filled.
>> +		 */
>> +		if (actual == 0)
>> +			goto wait_buffer;
>> +	}
>> +
>> +	return actual;
>> +}
> 
> [Severity: Medium]
> Does releasing byte_cntr_data->read_lock on return from
> tmc_byte_cntr_get_data() leave copy_to_user() and
> tmc_etr_update_buf_node_pos() unserialized in tmc_read()?
> 
> Because /dev/tmc_etrX is a character device opened with
> nonseekable_open(), the VFS does not hold file->f_pos_lock across
> vfs_read().  Once tmc_byte_cntr_get_data() returns, read_guard drops
> byte_cntr_data->read_lock before tmc_read() copies from bufp or advances
> buf_node->pos:
> 
> CPU0                                    CPU1
> tmc_read()
>    tmc_byte_cntr_get_data()
>      lock(&byte_cntr_data->read_lock)
>      pos = buf_node->pos
>      tmc_etr_read_sysfs_buf(..., &bufp)
>      unlock(&byte_cntr_data->read_lock)
>    copy_to_user(data, bufp, actual)
>                                          tmc_read()
>                                            tmc_byte_cntr_get_data()
>                                              ...
>                                            tmc_etr_update_buf_node_pos()
>                                              nd->pos += actual
>                                          tmc_read()
>                                            tmc_byte_cntr_get_data()
>                                              actual == 0:
>                                              buf_node->reading = false
>                                              buf_node = NULL
>                                              tmc_etr_switch_buf_node()
>                                                <-- ETR DMAs into bufp while
>                                                    CPU0 is in copy_to_user()
>    tmc_etr_update_buf_node_pos()
>      nd->pos += actual  <-- advances the newly switched buf_node->pos
> 
> [ ... ]
> 
>> +static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
>> +{
>> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +
>> +	/*
>> +	 * Do the unprepare operation only when the byte_cntr_data->reading
>> +	 * is truly set
>> +	 */
>> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
>> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
>> +	    !byte_cntr_data->reading)
>> +		return -EINVAL;
>> +
>> +	tmc_clean_etr_buf_list(etr_drvdata);
>> +
>> +	/* disable_irq_wake() may sleep on slow-bus irqchips, call it unlocked */
>> +	disable_irq_wake(byte_cntr_data->irq);
>> +
>> +	/*
>> +	 * The byte-cntr register is not accessed here: the trace path, which
>> +	 * keeps the CTCU powered, may have been released already. It is reset
>> +	 * when the path is disabled.
>> +	 */
>> +	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
>> +		byte_cntr_data->buf_node = NULL;
>> +		byte_cntr_data->reading = false;
> 
> [Severity: Medium]
> Can freeing etr_buf_list before clearing byte_cntr_data->buf_node and
> byte_cntr_data->reading cause a use-after-free in
> tmc_byte_cntr_get_data()?
> 
> If a byte-cntr read session closes while byte_cntr_data->buf_node still
> points to a partially read buffer and the trace stops before
> tmc_read_unprepare_byte_cntr() acquires byte_cntr_data->spin_lock, a
> concurrent open() and read() on /dev/tmc_etrX can enter
> tmc_byte_cntr_get_data() while byte_cntr_data->reading is still true:
> 
> CPU0                                    CPU1
> tmc_read_unprepare_byte_cntr()
>    tmc_clean_etr_buf_list()
>      __tmc_clean_etr_buf_list()
>        tmc_etr_free_sysfs_buf(buf_node->sysfs_buf)
>        kfree(buf_node)
>    disable_irq_wake()
>                                          /* trace stops */
>                                          tmc_open()
>                                            tmc_read_prepare_etr()
>                                              tmc_read_prepare_byte_cntr()
>                                                mode != CS_MODE_SYSFS -> -EINVAL
>                                              /* falls back to generic read */
>                                              drvdata->reading = true
>                                          tmc_read()
>                                            tmc_etr_get_sysfs_trace()
>                                              tmc_byte_cntr_get_data()
>                                                pos = buf_node->pos
>                                                  <-- use-after-free
> 
>> +		/*
>> +		 * Complete the session with reading cleared in one critical
>> +		 * section, so that a new session can't start in between.
>> +		 * ctcu_platform_remove() may free byte_cntr_data after this,
>> +		 * don't use it anymore.
>> +		 */
>> +		complete_all(&byte_cntr_data->session_done);
>> +	}
>> +
>> +	module_put(THIS_MODULE);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
>> +	.read_prepare	= tmc_read_prepare_byte_cntr,
>> +	.read_unprepare	= tmc_read_unprepare_byte_cntr,
>> +	.get_trace_data	= tmc_byte_cntr_get_data,
>> +};
>> +
>> +/* Start the byte-cntr function when the path is enabled. */
>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
>> +{
>> +	struct coresight_device *sink = coresight_get_sink(path);
>> +	struct tmc_drvdata *etr_drvdata;
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +
>> +	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
>> +	if (!byte_cntr_data)
>> +		return;
>> +
>> +	etr_drvdata = dev_get_drvdata(sink->dev.parent);
>> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>> +	/*
>> +	 * Don't start byte-cntr function when irq_enabled is not set, when the
>> +	 * CTCU device is being removed, or when the read of the previous trace
>> +	 * is still in progress: the sink can't be enabled until it is finished.
>> +	 */
>> +	if (!byte_cntr_data->irq_enabled || byte_cntr_data->removing ||
>> +	    byte_cntr_data->reading)
>> +		return;
> 
> [Severity: Low]
> Can a trace path enabled while tmc_read_unprepare_byte_cntr() is running
> start the ETR sink without starting byte-cntr?
> 
> The check on byte_cntr_data->reading assumes that enabling the ETR sink
> will fail while the previous byte-cntr read session is still active.
> However, tmc_etr_get_sysfs_buffer() only checks
> !list_empty(&drvdata->etr_buf_list), and tmc_read_unprepare_byte_cntr()
> empties etr_buf_list in tmc_clean_etr_buf_list() (and calls
> disable_irq_wake()) before clearing byte_cntr_data->reading:
> 
> CPU0                                    CPU1
> tmc_read_unprepare_byte_cntr()
>    tmc_clean_etr_buf_list()
>      /* etr_buf_list is now empty */
>    disable_irq_wake()
>                                          coresight_enable_path_from_to()
>                                            ctcu_enable()
>                                              ctcu_byte_cntr_start()
>                                                byte_cntr_data->reading == true
>                                                return;  <-- skips byte-cntr
>                                            tmc_enable_etr_sink()
>                                              tmc_etr_get_sysfs_buffer()
>                                                list_empty(&etr_buf_list) == true
>                                                /* sink enables */
>    byte_cntr_data->reading = false
> 
>> +
>> +	/*
>> +	 * The etr_bufs of the reserved mode share one memory region, they
>> +	 * can't be switched by byte-cntr.
>> +	 */
>> +	if (etr_drvdata->etr_mode == ETR_MODE_RESRV)
>> +		return;
> 
> [ ... ]
> 
>> +/* Stop the byte-cntr function when the path is disabled. */
>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
>> +{
>> +	struct coresight_device *sink = coresight_get_sink(path);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +
>> +	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
>> +		return;
> 
> [Severity: Medium]
> Can byte_cntr_data->enable remain stuck at true after the trace path is
> released if a session falls back to generic read?
> 
> ctcu_byte_cntr_start() runs before the ETR sink is enabled and only checks
> etr_drvdata->etr_mode == ETR_MODE_RESRV.  However,
> tmc_etr_get_sysfs_buffer() can reuse an existing drvdata->sysfs_buf whose
> mode is still ETR_MODE_RESRV (after buf_mode_preferred was changed without
> changing buffer_size), or buf_mode_preferred can be set to resrv after the
> trace starts.  When /dev/tmc_etrX is then opened,
> tmc_create_etr_buf_list() returns -EINVAL and tmc_read_prepare_etr() falls
> back to generic read, setting drvdata->reading = true while
> byte_cntr_data->enable remains true.
> 
> If the trace source is disabled while that generic read file descriptor is
> open, tmc_disable_etr_sink() sees drvdata->reading == true and returns
> -EBUSY without clearing CS_MODE_SYSFS on the sink.  ctcu_byte_cntr_stop()
> then sees coresight_get_mode(sink) == CS_MODE_SYSFS and returns early
> without zeroing irq_ctrl_offset or clearing byte_cntr_data->enable, right
> before coresight_release_path() drops the CTCU runtime PM reference.  From
> that point on, irq_enabled_store() permanently fails with -EBUSY and
> ctcu_platform_remove() will write to the CTCU register while the CTCU is no
> longer kept powered by an active path.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index 739105acb0a13..94283661f10d4 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> 
> [ ... ]
> 
>> @@ -244,10 +356,65 @@ static int ctcu_platform_probe(struct platform_device *pdev)
>>   static void ctcu_platform_remove(struct platform_device *pdev)
>>   {
>>   	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	unsigned long flags;
>> +	int i;
>>   
>>   	if (WARN_ON(!drvdata))
>>   		return;
>>   
>> +	/*
>> +	 * Signal all active byte-cntr readers to exit, then wait for them to
>> +	 * finish before resetting the ops pointer and freeing driver data.
>> +	 * Without this, a reader blocked in wait_event_interruptible_timeout()
>> +	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
>> +	 *
>> +	 * The wait ends only when the userspace closes the tmc_etr file, so an
>> +	 * unbind with the file left open blocks until then. Unloading the module
>> +	 * is rejected with -EBUSY while a read session is open, so only a manual
>> +	 * unbind can block here.
>> +	 */
>> +	for (i = 0; i < ETR_MAX_NUM; i++) {
>> +		byte_cntr_data = &drvdata->byte_cntr_data[i];
>> +		/* The port was not initialized by ctcu_byte_cntr_init() */
>> +		if (!byte_cntr_data->irq)
>> +			continue;
>> +
>> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
>> +		/*
>> +		 * Set enable=false to signal teardown to racing readers, and
>> +		 * removing=true to keep a new path from enabling byte-cntr again.
>> +		 * ctcu_byte_cntr_stop() won't touch the register once enable is
>> +		 * cleared, so disable the IRQ here. The CTCU is powered as long as
>> +		 * enable is set, which is cleared when the path is disabled.
>> +		 */
>> +		if (byte_cntr_data->enable)
>> +			ctcu_program_register(drvdata, 0,
>> +					      byte_cntr_data->irq_ctrl_offset);
>> +		byte_cntr_data->enable = false;
>> +		byte_cntr_data->removing = true;
>> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> 
> [Severity: Medium]
> Can tmc_byte_cntr_get_data() observe byte_cntr_data->enable == false before
> byte_cntr_data->removing == true and fall back to reading the unsynced live
> ETR buffer?
> 
> tmc_byte_cntr_get_data() checks byte_cntr_data->enable and
> READ_ONCE(byte_cntr_data->removing) without holding
> byte_cntr_data->spin_lock:
> 
> CPU0                                    CPU1
> ctcu_platform_remove()
>    byte_cntr_data->enable = false
>                                          tmc_etr_get_sysfs_trace()
>                                            tmc_byte_cntr_get_data()
>                                              wait_event_interruptible_timeout()
>                                                /* sees !enable */
>                                              if (byte_cntr_data->enable) ...
>                                              else {
>                                                if (READ_ONCE(removing) && ...)
>                                                  /* sees !removing */
>                                                return 0;
>                                              }
>                                            /* ret == 0 falls through */
>                                            tmc_etr_read_sysfs_buf(sysfs_buf, ...)
>                                              <-- reads live unsynced ETR buffer
>    byte_cntr_data->removing = true
> 
> Setting byte_cntr_data->removing = true before clearing
> byte_cntr_data->enable (with paired release/acquire or barrier ordering)
> would ensure the reader sees removing set once it observes enable cleared.
> 
>> +
>> +		/* Wake up the blocked reader, then wait for the session to end */
>> +		wake_up_all(&byte_cntr_data->wq);
>> +		wait_for_completion(&byte_cntr_data->session_done);
>> +
>> +		/*
>> +		 * The ending session completes it with the lock held. Take the
>> +		 * lock once more, to be sure that it has released the lock
>> +		 * before byte_cntr_data is freed.
>> +		 */
>> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
>> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
>> +	}
>> +
>> +	/*
>> +	 * No byte-cntr session is left and a new one can't start now. Stop the
>> +	 * tmc driver from calling the byte-cntr ops before the CTCU device is
>> +	 * unregistered and freed.
>> +	 */
>> +	ctcu_byte_cntr_put_ops(drvdata);
>> +
>> +	ctcu_remove(pdev);
> 
> [Severity: Medium]
> Can an in-flight byte_cntr_sysfs_ops call race with ctcu_platform_remove()
> and cause a use-after-free on ctcu and drvdata?
> 
> byte_cntr_data->session_done is initialized as completed in
> ctcu_byte_cntr_init() and is only reinitialized inside
> tmc_read_prepare_byte_cntr() after tmc_etr_get_ctcu_device() and
> ctcu_get_byte_cntr() have already run.  In addition,
> tmc_read_prepare_etr(), tmc_etr_get_sysfs_trace(), and
> tmc_read_unprepare_etr() read byte_cntr_sysfs_ops with READ_ONCE() and call
> into it on every ETR open, read, and close (even during generic reads when
> session_done is completed and THIS_MODULE is not pinned), while
> ctcu_byte_cntr_put_ops() simply clears byte_cntr_sysfs_ops with
> WRITE_ONCE() without waiting for in-flight callers:
> 
> CPU0                                    CPU1
> tmc_read_prepare_etr()
>    byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops)
>    tmc_read_prepare_byte_cntr()
>      ctcu = tmc_etr_get_ctcu_device()
>                                          ctcu_platform_remove()
>                                            wait_for_completion(&session_done)
>                                              /* already complete */
>                                            ctcu_byte_cntr_put_ops()
>                                            ctcu_remove()
>                                              coresight_unregister(csdev)
>                                            /* devres frees drvdata */
>      ctcu_get_byte_cntr(ctcu, ...)
>        dev_get_drvdata(ctcu->dev.parent)
>        coresight_get_in_port(etr, ctcu)  <-- use-after-free
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 4b40b692be4d8..6ad09995ba87c 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -293,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
>>   		return -EFAULT;
>>   	}
>>   
>> -	*ppos += actual;
>> +	if (!tmc_etr_update_buf_node_pos(drvdata, actual))
>> +		*ppos += actual;
>>   	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>>   
>>   	return actual;
> 
> [ ... ]
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index cc341cdf8d8e5..d856f0a190f72 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1178,23 +1181,44 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
> 
> [ ... ]
> 
>> +ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>> +				loff_t pos, size_t len, char **bufpp)
>> +{
>> +	ssize_t ret;
>> +	const struct tmc_sysfs_ops *byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
>> +
>> +	if (byte_cntr_ops) {
>> +		ret = byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
>> +		/*
>> +		 * -EINVAL means byte-cntr has no active read session. 0 means
>> +		 * byte-cntr has no more data because the sink has stopped, the
>> +		 * last etr_buf is read by the generic read. Anything else is
>> +		 * the result of the byte-cntr session.
>> +		 */
>> +		if (ret != -EINVAL && ret != 0)
>> +			return ret;
>> +	}
>> +
>> +	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
>>   }
> 
> [Severity: Medium]
> Does tmc_read() swallow the negative error codes returned by
> tmc_byte_cntr_get_data() and turn them into EOF?
> 
> tmc_etr_get_sysfs_trace() propagates negative errors from
> tmc_byte_cntr_get_data() such as -ERESTARTSYS (when
> wait_event_interruptible_timeout() is interrupted by a signal), -EINTR,
> -ENOMEM, and -ENODEV.  However, the caller in tmc_read() converts all
> non-positive values to 0:
> 
> drivers/hwtracing/coresight/coresight-tmc-core.c:tmc_read() {
> 	actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
> 	if (actual <= 0)
> 		return 0;
> 
> When a signal arrives while userspace is blocked waiting for trace data,
> read() returns 0 (EOF) instead of restarting or returning -EINTR, causing
> the reader to terminate trace collection prematurely while the ETR sink is
> still running.
> 

