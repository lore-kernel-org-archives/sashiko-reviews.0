Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557317;
	b=uv0npntbi6YSTW/JoiPMAhPCieKXdDFgyyghOXP2Q3IOwGWjjXePW56RKApp6Vm9fydG
	 fWTfhTKh38u6QRhgrcoRVLo/eOJNtILubTVzT8UyGDOIOO+Md6PoBXeQfbq55oDVohd7L
	 Ue0MKhHt1asZLXENe5wM8VrEZ1k1OFf+HxHTjUOe+fgVgbdTSx4K4PgPZcpSHBuIOeLjv
	 fVJq7Lr118ki5uD+iCQvJcIIIxXzYjPzKdbagqlfqGHwpPeI5SIB3IN1p5Qd4uBSN1uUO
	 teQQXJTWrFRY5hri+/Y46P/PdB5RiKILDPLdqLHLEqKuH+FQXUQu1+Dsj+wEPruSSvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z9eerei04GWtYFY+WPJOl9hOHYkxbbEfHVWglbpjEjY=;
	b=shLRZd7t7hbZrQ+KqfIJ5BziWC/XYQIJc9T1YKOTvRybADascXk9CMpsd8EQz0pJmZ7a
	 Y2GHbhMz8KCSIc0EeoaNbdDAzigq1BD16MM8cAjWp6EU3mP1WTsqy7tlcDxHSBq0fGuvP
	 DABnqVtEB7fIxsm9bPcKmQ66VipLUiIvspQPU+zIfKx3WHrduoo9QV51XiCpmkOiytPV9
	 hcXokFJ8XMa1yYhwaexPWpwwZrFOIkEbrYxbjcD84HVZ7WQvXSVTSH2fXAnfviNl9HrpI
	 lh2ViT5e6pfSqI10DOe4NKNnYGv/ygCV8dI8b+8qfsgUMw5v6Q/Mb9sR6JMKX9+pU4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=GjD4OHWE;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=k2BcJRyC;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A46F606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 21:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A46F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=GjD4OHWE;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=k2BcJRyC
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOLXV4S1527622
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 16:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=z9ee
	rei04GWtYFY+WPJOl9hOHYkxbbEfHVWglbpjEjY=; b=GjD4OHWE25V25kkLPYT/
	6709aSFK6VrW/tAmCpio5Ad4/Zdd9KZJjQ++dNGDtesTwNtcQdLxwYoEeSbWVk5Y
	MeMVvBDQ3IMECebQPrc5sc4Po7B/1mVnG7AQS3gPr1gI0ZpvV4KklqjYovSluEXa
	Fl/zKe4yx2myXjxXobUgKWMFvalqJ9bI+Ruvv/aKGRnShWQ3EEwL3XyhLYvpjIQb
	Y+E+9xM1V9eKxmr2SPb2Cjj7BrlxwMN+rZ5x34m3JHYTvyXsRvLrObuFwE7TcW5i
	rQzRQtoGVOAQ4gYPtEBp245adKjR7nxr3artQDTu6Q3yYxV6ZdXRni2kNd7OCgm0
	Mw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j5gc4sgc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 16:55:16 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91256a7b7b3so75204776d6.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 13:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795557315; x=1796162115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9eerei04GWtYFY+WPJOl9hOHYkxbbEfHVWglbpjEjY=;
        b=k2BcJRyC9b8qsOub+ET8tffLUjykP4ZlzmTmbasENJwJDGSmfsqMSySsU5P/fsDeR/
         QMr8Wv/j6FGE27QFFKpmP8G+pMx+e5hOrcOFI3VevWFRR1mkg/pKQF90FpXNDxyuIH6D
         afsBA1j+9OE4itkQdxTey8Rg0nYFwvFujqKpoG9gmBc5ysLnx2pJ1jDxFIT3zaSUQhVr
         Kjft54vR+FeldLTuwwZc4zwHSVszW3qyb9cNqzobel7kVePiKh0KO5ThCwwjF0HsXD8i
         E/m4cTLA+B9PAoPeI07wVcyEl2NPCqezdUruqxMBHL8opgoNJSKYZCoAERwEj/8SzIre
         L1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557315; x=1796162115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9eerei04GWtYFY+WPJOl9hOHYkxbbEfHVWglbpjEjY=;
        b=JgMGQWRFoBX4F4h7jJeQKQqJE0Xymn7DQp1psyFVsfY8RB3gJRm4u1sBMfDoFfe57o
         b4qRLtKT8RxY79vpaP2c2FkMwZUJ6uJx3N/0nXuQVA2w5zRPfXonERfkqdqjsLMWZ4WG
         cXAGewZF7JJM4Cf9U0bLmxAwrFWVEQZwIOOnr73IP6ZBCBDSJOK4q4AwIVLAlyYDYwKq
         AVxSUHWiSAzxrylxJzm2wIDcj5ZvnvXEuzzAxynV811OyGuo7Uxf5mymrIF0/jX1C1VC
         bGsIphWHv5TjxbYJ/ZYg9OpwzxiMoFWJ3wik8yWKzTano8wpFg7KKabZogIr4IoO149M
         6ZVQ==
X-Gm-Message-State: APuU4Z8BoehuPRn8AWlv8cCz6L5wNIWalm9MyZd6z1DYAkQh2uIVaHo7
	avT23M9LTY+B54jt5/6rwpVKZgRbPAbh0srkaENvSK78cU+XBSVrGaR1IJLwt6gEvZhexjRIPAp
	vLGELYzBQYVderm3o6dxUPtDsffZgC7YKrUN70Dfp6aYcTitUnmg3Ip1rN9lzwZFZShFZf8Y7Jw
	==
X-Gm-Gg: AZFdTZesornc6mUc2O50UbxFfg0iiKdTqXSeexoOtf7vQ7KBWeGIgfCCwWvnLhT2WSR
	gGQbZ6MhjjQHp2O/vS+PZ3ZfdH+l2kU2XY05YkqkIHlE02QJjc2PQdib6uQauF8Icc211A/ZtDB
	S/xxNKvaVXB/bQmaSt5b7D/BF0qYrBuNt8WTkfxR77JCeF2MzS+JPSssNK8KOd8MV/k64Sk5qp6
	H2v6yeBK201/ejyLx1eUg90VbKu55iZokTgx1cYww1hbRI9nH8vYQwxdstspKZJI5DhQieFItig
	P7mPXNpyN3ePyvz5yH7f0SyedW1VcX9WU0KnmPtyqkNEr6TNpEiqy2q4SmgElyjB7QNHlzdHxIT
	RwMMl6wBsFXmH9slSCxSOdqAEiY220shW65kSc9/OGbnU2q/aG7uo3/XtwZWr7M80cw==
X-Received: by 2002:ad4:5d67:0:b0:91f:10c3:1bfc with SMTP id 6a1803df08f44-92134ac6dbemr305574296d6.48.1795557315347;
        Tue, 24 Nov 2026 13:55:15 -0800 (PST)
X-Received: by 2002:ad4:5d67:0:b0:91f:10c3:1bfc with SMTP id 6a1803df08f44-92134ac6dbemr305573936d6.48.1795557314873;
        Tue, 24 Nov 2026 13:55:14 -0800 (PST)
Received: from [10.206.101.158] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b456csm147795236d6.13.2026.11.24.13.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 13:55:14 -0800 (PST)
Message-ID: <3f099de2-4fbb-45b0-ba7f-3a20f6ec7e4a@columbia.edu>
Date: Tue, 24 Nov 2026 16:55:13 -0500
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
Subject: Re: [PATCH v2 1/4] gfs2: make the log page pool per superblock
To: sashiko-reviews@lists.linux.dev, Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
 <20261124-gfs2-log-folio-v2-1-f229e90c8285@columbia.edu>
 <sashiko-outbox-232028@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <sashiko-outbox-232028@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vW3x5VHIywAhxLUeGqxe-88NqrSxfTLI
X-Authority-Analysis: v=2.4 cv=JJKuIMKb c=1 sm=1 tr=0 ts=6b0607c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=VwQbUJbxAAAA:8 a=GR7SoLcrvvc17LyDSjIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4NiBTYWx0ZWRfX6Gxd3cMfs0gp
 31nL9cf5fGviZlVzmLjUaXXQfMWeIF9lS5kC7UMPAVysg3tviU5FA+UROOnxhMg5DSLvozswfvM
 BuruRtQCuXgWZqylIJjUKXM0HZXev2RjTZ4HANpivp0u907iV5wM3CLlxvSFeS60AqooTm5eEBa
 MwwH0ixoNCEfPPbe/qXVOTMWVvcGjStknMtfjo9aZRGB92phhcPDdH+MBXyasd/PjozVgeGnk6M
 +juppDFp6TA9hTDD6NEAYn7fs6c4mQ4oKBFC3aXs8al1NDRXoGgzeOguSSD4eYsp23dHQHxjNvl
 evsbiKukF56QTMvlJUGUM3U2smn/rg/WTQdtA6e9zfmr9INlPlCmo6FzE2bQZnrVgY96jjzr14V
 c8bA+0ZAutj1tczAOtBhd/69cSErtkcoeOsrh0fvKyb2MGMFMDxneaeSVAzCAxiJ+pKqd+9qRCz
 Nz+IE10FoQUwA4evSWw==
X-Proofpoint-GUID: vW3x5VHIywAhxLUeGqxe-88NqrSxfTLI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4NiBTYWx0ZWRfX82YRsY0SKPCq
 tofr7scEy3cL1knhAlalBlOyEZbDFVmLGH3rb6etlhpn4RxIGlrAOjCn2WpyShGI6OjTvMyTj2e
 RuEiNUraHDe2EncYYdqUsCs84AhJbRkqz1LNK350BeAlCkCZ2i1E
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 malwarescore=0 bulkscore=10 lowpriorityscore=10 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240086

On 11/24/26 4:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] gfs2: use-after-free on sd_log_buf_pool in gfs2_end_log_write()
>    after free_sbd()
> --
> 
> commit 6dc37dfa05bee3bb13ea4a43812ebcbe3533794a
> Author: Tal Zussman <tz2294@columbia.edu>
> 
> gfs2: make the log page pool per superblock
> 
> This commit replaces the global gfs2_page_pool mempool with a
> per-superblock sd_log_buf_pool initialized in gfs2_fill_super() and
> destroyed in free_sbd().
> 
>> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
>> index 6ec47376aecf2..f62a893ce5a2b 100644
>> --- a/fs/gfs2/ops_fstype.c
>> +++ b/fs/gfs2/ops_fstype.c
>> @@ -67,6 +67,7 @@ void free_sbd(struct gfs2_sbd *sdp)
>>  {
>>  	struct super_block *sb = sdp->sd_vfs;
>>  
>> +	mempool_exit(&sdp->sd_log_buf_pool);
>>  	free_percpu(sdp->sd_lkstats);
>>  	sb->s_fs_info = NULL;
>>  	kfree(sdp);
> 
> [Severity: High]
> Can free_sbd() destroy sdp->sd_log_buf_pool and free sdp while log bios
> carrying pages from sd_log_buf_pool are still in flight?
> 
> Previously, gfs2_end_log_write() returned pages to the global
> gfs2_page_pool, which stayed alive until module unload.  Now it calls
> mempool_free(page, &sdp->sd_log_buf_pool), while free_sbd() runs
> mempool_exit(&sdp->sd_log_buf_pool) and kfree(sdp) without waiting for
> sdp->sd_log_in_flight via log_flush_wait(sdp).
> 
> Two paths can reach free_sbd() with log bios still in flight:
> 
> 1. During journal recovery, clean_journal() calls gfs2_write_log_header(),
>     which allocates a page from sdp->sd_log_buf_pool and submits
>     jd->jd_log_bio asynchronously via gfs2_log_submit_write() without
>     calling log_flush_wait(sdp).  If a subsequent step in gfs2_fill_super()
>     fails after journal replay, or a read-only mount that replayed a
>     journal is unmounted (where gfs2_put_super() skips gfs2_make_fs_ro()),
>     free_sbd() runs without log_flush_wait(sdp).
> 
> 2. In __gfs2_log_flush(), if the filesystem is withdrawn after
>     lops_before_commit() or gfs2_log_submit_write() has submitted bios
>     with pages from sdp->sd_log_buf_pool, it jumps to out_withdraw and
>     skips log_write_header() and log_flush_wait(sdp):
> 
> fs/gfs2/log.c:__gfs2_log_flush() {
>      ...
> 	lops_before_commit(sdp, tr);
> 	if (gfs2_withdrawn(sdp))
> 		goto out_withdraw;
> 	if (sdp->sd_jdesc)
> 		gfs2_log_submit_write(&sdp->sd_jdesc->jd_log_bio);
> 	if (gfs2_withdrawn(sdp))
> 		goto out_withdraw;
>      ...
> }
> 
>     Subsequent unmount flushes return early because the filesystem is
>     withdrawn, so free_sbd() is reached while those bios are still in
>     flight.
> 
> When the bio completes after free_sbd(), gfs2_end_log_write() hits a
> use-after-free on sdp and sdp->sd_log_buf_pool (or dereferences NULL
> pool->elements inside mempool_free()).  Calling log_flush_wait(sdp)
> before mempool_exit() in free_sbd() would ensure all in-flight log bios
> have completed.
> 
This is mostly pre-existing (and the same issue as the other Sashiko
report), but I can add a patch at the beginning of the series to fix it.
I think adding a log_flush_wait() at the start of gfs2_jindex_free() should
be sufficient.
