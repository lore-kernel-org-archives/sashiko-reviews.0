Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792521739;
	b=PyzcVzrganCwlN/4cFklqgfyKE9Rr4BaUADevnhiTkyfy21ZWHWWZ8ZzVGixYUjO/TNw
	 /uyj88skbs188cDAxOxFeCTcRmvztPPvngS6xxShoM9Eq/uMp2vWbWlr2BtHBKdWkllWX
	 r1Hn5tEEkQqk9HLfvMkPt1ja06eGKAFd6SoewhxtyvxVjA4Vy+u9GlOzRJKuQVlm3Jtjw
	 rjz1BnZwof2+ELEeKY7p4qjfV7u9es62azNlB0+Q4OuR9E0i3hI2a0nbHphE9q1hbT3sA
	 OR+4nih0cm30AyX2VbjXBMKghiKqvZ9YE5ysqTSWT6mzcbbPhepDmAwrrX2manmPd/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jUtbVh0o2LJHbMc08tIXjm+HG6ZwcUXAt7C4o4W0peQ=;
	b=Li02qIe1DtLxaZdSxlIMa6zXcgGx0L7Kw0NMuW30uGWLDK7g4gjCHmgZJtwTLqKAc+l5
	 O19Uu9Ysmwcq84c1R/xt/89lXdiOJP7isdz5QQHrsuJMBlNUSsRcCzGHjPsXTNdIMhkZd
	 sELMtRRFIZ0ArNJlomgLPQiV/LW3lQuXZk8n74G4cHoulCypUI7kd1YkYPaQtgSYVyGrD
	 LJYwFPU+RciE6Y+3CAL7OC6tUZ8eQ8eputgwmK+561JKCn3baw8HVqYyPAaaWjBC5fpkp
	 KHerbGr7Qs2w74xGKobBhpIT1RWPtewGGuXS0IZJqIQxlKYpuEDcCDf5L3t2jRaYuRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crowdstrike.com;
	spf=pass smtp.mailfrom=crowdstrike.com;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=bPWErbvq;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=L7mTc8MD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BCD606A319
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 18:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80BCD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=bPWErbvq;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=L7mTc8MD
Received: from pps.filterd (m0354652.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KIQEr32358779
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 18:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=jUtbVh0o2LJHbMc08tIXjm+HG6ZwcUXAt7C4o4W0peQ=; b=bPWE
	rbvqW1iU8rtZ0EZrtlNB3aLjK4HmA4PaxEZPDnW5R0dlUfF05Q4Uiqiiw6K/ZqGg
	zMTpGScNjjskiIQWthren6uYqgD2tz+pcDt9JTTkvasfAMCzNQDrfSiOcCvAkStM
	uxvfawOCqGz5MKsju2sSqULb8j7Q76lgofgvPoLsb0QRjajJ2MvgEHyAM2ZDtQg3
	31Xfu8SVIjQA11OApOISMwuTklF+8iJgHyQxX4u3tPZCOXQ6jqQeJveDJa4qURUc
	d9rUKzCnTalVNtpmwBJUM9dOZKSl6YRhDyOfQ2G9UNN9sJz69g0ZD+/p/MLIeC8D
	RBvPB0HgNDcs26Ko+A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4hdw6yukhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 18:42:12 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6713ebbca2dso4532158d50.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 11:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792521731; cv=none;
        d=google.com; s=arc-20260327;
        b=O0O8eeRzte9Jvq72yVnRfiGskEkgE5hNSXXVGxTypD0opXetuX99ap9Nd+AK5KCbDP
         LqDMs/wuVB9GUdlKFwWrgPvWmfkHMLnqN60WHXa2SBbo3UYNWhe/lf41jy0zIkfnOYOE
         tIf6HwBjzC/jJ2kbHAzcnhUxCoJWbHgzYRsfe3jkb4PhyznHrde3NZiq5HzPofQnAv75
         w1wHZV6FLQNPyY/No+HA2AFKwqOkKOhZvgrkLTHLFYzSm4LqCj6Ty8iFd15zNcR4Kgb0
         Rt+MJchI2qbmDIVOvZAsh537TZb4TNxS6gMd+Zb2/kdPLjZbi/Y0sgtlwc1M51W0qT41
         LrsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jUtbVh0o2LJHbMc08tIXjm+HG6ZwcUXAt7C4o4W0peQ=;
        fh=crr6cr8nRGoFwoUzs1NJWf7PsNaKmy2zekPqFddeIP4=;
        b=nbwsF7cmKJd/R3FQ5dRrf+h99tIjINXoIbUPC/RP6++T6YU3x1p4zafTujURQYMqY5
         LtAORGqRhEiKa49vf8vrRlN5HNBCH4ZrV0Z8sUTpeVW1q52mVifl9SjeDTPKmH5qHIt7
         LHyZlmTRG3CfrHapFIanE5CutEPPYJSQH1guqlyodGlSStJXwj65pnrzXC2plYsImvf7
         Nlau1sYIJpGdCYcYMbl7/XWPihM1CXNVRtY250WtISlm3yH8p4uoWabz3TC3bW5+LgZm
         V/nX4yrzchP1YXW0eSk87s98rojNpvm3l3N+GB5kg3gL8nckEmG8jUPo9d724jr+D0Sy
         VApg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1792521731; x=1793126531; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jUtbVh0o2LJHbMc08tIXjm+HG6ZwcUXAt7C4o4W0peQ=;
        b=L7mTc8MDMRcy/l7lYJGiCmQfL/lMEJiKcv6QKJjkZfACUoxha5lcuKJNp71Pi6M2Ns
         hRdGdDrf0C1+jLEgOzG6S1m1hbcByq5H0kiMOS11D67lDzw3sE1dURCi8zk2iDBdXue6
         kN2ukTJl5OL1Okc1FhX8iSp+oAIhHSjbXv51NzVFFUgZrKNOrBn7eDZhn6/QGDkSF1WJ
         GzuyNd+3Ln34RyXF6E8qeJ0NUwTIodJDYl8SfsSDcFe13P8CPo+YAUdGv6oUAC+EGzFS
         jTAvu0AQQh9CiH2lzX0zgiPyo2wzh3QihnV5UpGaqQksB/FufTXYTEYL5nNZxkQiaomV
         jGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792521731; x=1793126531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUtbVh0o2LJHbMc08tIXjm+HG6ZwcUXAt7C4o4W0peQ=;
        b=jMeUDRp45cUAPD52c+Jy/dGltrzomYJTxGp7ed+Tg5RK4x9U8sRuC0901Eda2MYnyv
         uE608lqfI3KjQLaAmepYWJhn2Ps75ynYTGoRYTyUhB1Pn7iFTYYpm9hnl10KhEgMhbDN
         ZRblKWUdhRFgNqpCDRZW4WqswuScviXG1Vh7W3JwQGfBe1gHHDEc20me9HkdbwJBKyl8
         L8WLoq2UTAXGtuDLak82A6AQz6eM5gUGO4hGC4GkBDhiYYuAd0cRhl8zs9mOASwAERBS
         9pZfDLJE57XMBdNcpIXk+hhWmuiJjrz4X8uKupDSZyoPvqkCCm5CBT83p0wrzQJxoukc
         mEPg==
X-Gm-Message-State: AFq9FYJ1iTb2YFFrQdokY5Vyo0uF6LE5mSorcBmjBT+Qa1/O8yAO813U
	qhih7lDFo3piLCnYQt5SqptijqfvnUZyTJqbYN5yFLQZ7ZfbZOXrAygtZ+6hJ7JIbi8vmudikkS
	faCa9O/AMBuwH3+CeSi40VYIx5waHgI2zfxOF1jDLw4dab5ZGHqm+fnLciv5u1bT7MC+3w0+bFs
	8UtGkHqAozz/KV9NkPL6198aVTRMKuiRLygWFg6R50AKfZ
X-Gm-Gg: AYBFou01hiIAEc2iEeYIuMp2StHBirhDs7Mujk6ybTZAIxfR33w7U00msYfeS9vzcwg
	S/z/ui8oe6Er5KT7RPaMflIvrgS4rlaqXP4EnlhnM3s8sAHz8sT5FrMAwoqFKJUV/JXuo6tQyVQ
	l2LErJLvxKYGm9/tpXzbDBZwO4IjOON0wKCWle16k3RopY+yv2s+oNcLgM
X-Received: by 2002:a05:690e:458a:20b0:679:9b34:a2d0 with SMTP id 956f58d0204a3-67a0e04c052mr35866d50.18.1792521731394;
        Tue, 20 Oct 2026 11:42:11 -0700 (PDT)
X-Received: by 2002:a05:690e:458a:20b0:679:9b34:a2d0 with SMTP id
 956f58d0204a3-67a0e04c052mr35857d50.18.1792521730753; Tue, 20 Oct 2026
 11:42:10 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261010143156.379864-1-andrey.grodzovsky@crowdstrike.com>
 <20261010143156.379864-8-andrey.grodzovsky@crowdstrike.com>
 <sashiko-outbox-166685@kernel.org> <CAOu3gNj7fYONFo2-UqcBVv5Uk2=d4Cw=0fvQvLPCwiDA6zc3Wg@mail.gmail.com>
 <CAEf4BzbxEBC7CGDTZF_3nvupgB4QGcV_k0e1mo5Zjm-g2nBWsQ@mail.gmail.com>
In-Reply-To: <CAEf4BzbxEBC7CGDTZF_3nvupgB4QGcV_k0e1mo5Zjm-g2nBWsQ@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Date: Tue, 20 Oct 2026 14:41:59 -0400
X-Gm-Features: AclHuK_WP2x-Ao-uFvy9C4kOMSC1LmRigf4JRrtOW4zkWzOcYDHv3TKhJn85JD8
Message-ID: <CAOu3gNjphM=_y+L0x+oHdw6AXRjQ9_KGfuLzqtb4CPFqO3n78w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 7/7] selftests/bpf: Convert veristat to BPF_PROG_LOAD_STRATEGY_MANUAL
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA3NCBTYWx0ZWRfXxWYki/yg0eqp
 hv1IF3yPWnjdC4j3rvpWqZJP45ucDf3YBu8/Q9CmfjdMd4ASXGZipVXn+ZHnNdgh8PLjxBluu6H
 llnVrVH/ryJpVfVfxQMd2omD47/edaZSci/FF/ZZGamWXfee1DVo
X-Authority-Analysis: v=2.4 cv=P4avFSAu c=1 sm=1 tr=0 ts=6ad7b604 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=2KvRFfd_T_-xjmS8C1aD:22 a=c92rfblmAAAA:8 a=pl6vuDidAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=8S6rCJZtphWnspf-Qy4A:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: N3MYm7L69ji_fLOb9mgC0C1MiqBvmmOM
X-Proofpoint-GUID: N3MYm7L69ji_fLOb9mgC0C1MiqBvmmOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA3NCBTYWx0ZWRfX5WA/u8B/sd5m
 cFVxCAhAxveZBId5Gi1zjxzExgsx3Qlwch+388hLqMFNs8ZRICbDJ5y3p5HuRWOwcK3zBciXwHO
 vzSFU4L2V2+TTN5/xb0EyfrnNVyW/Oe6KCwiHY394BQG3AFoE0SZxr5u5naMR+2X/L7YZCyt8de
 gg5ft3JTWWin+OxTRCEZgBqfjLNR8P0nloh07YexCH6wMYMs4vBzf6o/Tb3RBol6FUkkwXgIjLP
 isUIJRM4NkxTyw5gMY6cwlc9TOvEU4Pl/1qZp9Mh+GNyAh6ZVL5armWHwxCgjIvIl1eboSCgbwr
 wOOQNMvO3ESde1IjMLzpWrPdjiQfkDylQuJVplAFP0QiU6yiB2GQXILbJj/622dogwpga+1jglM
 XQ3wISvsirV5VTNWUo7QqaZOLOhkqcc8MREoExHCQp6i10Ywc/OCBy5uKwqu2rGTxZQZaLN+MGJ
 c2PUQZpW8hNlJcYiexg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11941
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200074

On Tue, Oct 20, 2026 at 2:39=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 7:53=E2=80=AFAM Andrey Grodzovsky
> <andrey.grodzovsky@crowdstrike.com> wrote:
> >
> > On Sat, Oct 10, 2026 at 11:08=E2=80=AFAM <sashiko-bot@kernel.org> wrote=
:
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > > - [Medium] bpf: veristat uninitialized memory read of log buffer on e=
arly load failure
> > > - [Low] bpf: veristat skips cleanup and info retrieval when BPF progr=
am fd is 0
> > > --
> > >
> > > commit 9ac34aec88e7eee9b39c53e8055bc5989345ce5b
> > > Author: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
> > > Subject: selftests/bpf: Convert veristat to BPF_PROG_LOAD_STRATEGY_MA=
NUAL
> > >
> > > This commit updates the veristat utility to verify programs using
> > > BPF_PROG_LOAD_STRATEGY_MANUAL alongside bpf_program__load() and
> > > bpf_program__unload(). It replaces the previous use of bpf_program__c=
lone(),
> > > ensuring RODATA maps are properly bound during verification and subse=
quently
> > > dropped upon unload.
> > >
> > > > diff --git a/tools/testing/selftests/bpf/veristat.c b/tools/testing=
/selftests/bpf/veristat.c
> > > > index 9cfc9b4b41c12..0cd19b59037f6 100644
> > > > --- a/tools/testing/selftests/bpf/veristat.c
> > > > +++ b/tools/testing/selftests/bpf/veristat.c
> > > [ ... ]
> > > > @@ -1726,18 +1725,15 @@ static int process_prog(const char *filenam=
e, struct bpf_object *obj, struct bpf
> > > >       if (env.force_reg_invariants)
> > > >               bpf_program__add_flags(prog, BPF_F_TEST_REG_INVARIANT=
S);
> > > >
> > > > -     opts.log_buf =3D buf;
> > > > -     opts.log_size =3D buf_sz;
> > > > -     opts.log_level =3D log_level;
> > > > +     bpf_program__set_log_buf(prog, buf, buf_sz);
> > > > +     bpf_program__set_log_level(prog, log_level);
> > > >
> > > >       cgroup_err =3D reset_stat_cgroup();
> > > >       mem_peak_a =3D cgroup_memory_peak();
> > > > -     fd =3D bpf_program__clone(prog, &opts);
> > > > -     if (fd < 0) {
> > > > -             err =3D fd;
> > > > -             if (env.verbose)
> > > > -                     fprintf(stderr, "Failed to load program %s %d=
\n", prog_name, err);
> > > > -     }
> > > > +     err =3D bpf_program__load(prog);
> > >
> > > [Severity: Medium]
> > > If bpf_program__load() returns an early error (e.g. from libbpf witho=
ut
> > > calling the kernel), could the dynamically allocated buf remain
> > > uninitialized?
> > >
> > > When env.verbose or env.top_src_lines > 0 is set, buf is allocated
> > > via malloc() but the fallback initialization only null-terminates the
> > > static array:
> > >
> > >         if (env.verbose || env.top_src_lines > 0) {
> > >                 buf =3D malloc(buf_sz);
> > >         ...
> > >         verif_log_buf[0] =3D '\0';
> > >
> > > If bpf_program__load() returns early without modifying the buffer,
> > > parse_verif_log(buf, ...) will read this uninitialized memory. Could
> > > buf[0] =3D '\0' be set directly on buf before loading?
> > >
> >
> > While this is a true observation, it seems to me this exact scenario
> > would also happen in the `clone` case, so it looks like a pre-existing
> > issue.
> >
> > > > +     fd =3D err =3D=3D 0 ? bpf_program__fd(prog) : -1;
> > >
> > > [Severity: Low]
> > > If standard input is closed, can bpf_program__load() assign file desc=
riptor
> > > 0 to the loaded program?
> > >
> > > If fd 0 is assigned, later checks will explicitly skip handling it:
> > >
> > >         if (fd > 0 && bpf_prog_get_info_by_fd(fd, &info, &info_len) =
=3D=3D 0)
> > >
> > > This causes the program's JIT statistics to be skipped. Should this c=
heck
> > > test for fd >=3D 0 instead of fd > 0?
> >
> > Same as above , I thiink the issue was pre-existing.
> >
> > >
> > > > +     if (err && env.verbose)
> > > > +             fprintf(stderr, "Failed to load program %s %d\n", pro=
g_name, err);
> > > >       mem_peak_b =3D cgroup_memory_peak();
> > > >       if (!cgroup_err && mem_peak_a >=3D 0 && mem_peak_b >=3D 0)
> > > >               mem_peak =3D mem_peak_b - mem_peak_a;
> > > [ ... ]
> > > > @@ -1774,7 +1770,7 @@ static int process_prog(const char *filename,=
 struct bpf_object *obj, struct bpf
> > > >       if (verif_log_buf !=3D buf)
> > > >               free(buf);
> > > >       if (fd > 0)
> > > > -             close(fd);
> > > > +             bpf_program__unload(prog);
> > >
> > > [Severity: Low]
> > > Similar to the issue above, if fd is 0, will this prevent the program=
 from
> > > being immediately unloaded and leave it in the kernel until the entir=
e
> > > BPF object is closed?
> > >
> > > Should this check also use if (fd >=3D 0) to ensure cleanup occurs?
> > >
> > > >       return 0;
> > > >  }
> >
> > To summarize, I agree all the 3 issues definitely need to be addressed
> > and I am happy to fix it. I just don't know if it should be as a part
> > of this patch-set or a standalone fix?
> >
>
> let's just land what you have, don't add fixes for preexisting issue
> to your patch set

Understood!

Thanks.
Andrey

>
>
> >
> > Andrey
> >
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://urldefense.com/v3/__https://sashiko.=
dev/*/patchset/20261010143156.379864-1-andrey.grodzovsky@crowdstrike.com?pa=
rt=3D7__;Iw!!BmdzS3_lV9HdKG8!3il3wicS8Eiw2ogONUagDMIrsqcvvmLZ1xXNrquJMEVXEJ=
r85kqsNp4CNFasNUc417QJ6t73GShkLS7-x-efgKPJp1HzLOdaJg$
> >
