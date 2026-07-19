Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EEE39C631
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784473705; cv=none; b=m360hR8yWliXieIdT4h+T+2ijVHYhgVmmMBAYuNF8h5q2s66JdxJpqD7/bPt11+gw9VAOzzaAWmcuCtdR7jfbaHZQrfQLRPW0pESbmzD1KF7zqQ6DQUnsr+PN1vMcn9TZXoBLBTDJQeC2sLj6HWWsMXd7Lk6zKwewSZ5LH8U0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784473705; c=relaxed/simple;
	bh=g6LQqsrWXiY+7OUBAHp4kf8xGJBX3+UC8Sq0rfIkDHg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RiN5QSUOrwlxmlyRZxfoRD2iR3/75ykShbeAV2vE1/KBdwpgWQPjTMEopSI2L3ck12bzcyUeN8CaOop2NX7BDVc5BtZ6cqsqG9rzbjLl0KIK6ZR0/m4vMhg+Im7ZPOeRt+miFoMFVSS2YMJ2r9FDMYNyKfLH9aiDsFWwGDEuxBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyPIMdfh; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyPIMdfh"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49557073245so2766615e9.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784473702; x=1785078502; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZQ1FlXHQOc6lZCsP6dU6XTD5qiNU+Uv/Pn0cEhz4kks=;
        b=KyPIMdfh/knph+bpLqnvaFAZwsQ8A8yueHWsScanInCcDfTPrwjOzyrBJrkSVZOqT1
         s3xk+mdp3ao/Y8bIwA8jaVsakn3tltAz6mMkCoFi6L4cTK2CA9JNdCjcRlQGpKZX9FcI
         DzuyLZH/+W6NqZ1uh1QX4mSblFldK+7ZEnYWQVQh6KW6mfNWeg41RTIcc4ObuSxeeelW
         0wSkhJslBA2WOo9Ih3cZljaJR110kQYyBweP1ytSdFkTb4TkPHjYwXSAbRlKVuiM+57j
         b7OCad/pTdFWFAuVbGnV8F5bSWWKTQ6MwBha4i82xwkfn/Qfbk4STxPm2gMF0bRkUg1b
         bNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784473702; x=1785078502;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQ1FlXHQOc6lZCsP6dU6XTD5qiNU+Uv/Pn0cEhz4kks=;
        b=K51Mig0+Aw/3H1+kWktenradShhZPK9cZ3+UygAy/ZzGZAydhgyNeFy+7FBM0lmFjS
         4Fz3lS2DgExUZarSFaEk8pq+phRbvzpPikS0e69eVkkQLg0HoW8iwrV+A4a8DuRQSTfA
         +aVRRzeTkx6YhyOFyFMvV+t4qu9iK1twifWa438iD6L7tXqwcpqg1i3fH3KZROxEnOgI
         XSAmXRD2lVQzx3xIcIuPuF2xWlWK+cv9XVmfJqBKAd97GxvOOq8WLsAldrm/mxKDDiz7
         RUU1qpPnvlHSUMm3yx67RAjy1kA5qdRTmw4jB+kCXql9nkknGybZldpTd5FWx/Li3Yjj
         e7TQ==
X-Gm-Message-State: AOJu0Ywxoj2tyGyq4eNKqk8hGXa4SbLFfLK2RznAzuuqJ2WABhVYKlq7
	4/4x2M2f68ddrGkcm3jbxwDqcS4/aAUHzpKw09BjWne6IQ02lDoZYN2Fk5WBG8Gq
X-Gm-Gg: AfdE7cmOxBuTMIJBNUqDpurSYAXJVBjh/fLaRR+XLdUSneqU7ikTik7PzLpqZMqEGaI
	K1eWbaUICq3+NYNoOFLiFQzhXomP1oUF/UCHFl+3Y9Z7F1nLdp1B/LWrLoV7+UWdZPQWGCQtXO6
	Iwnm+/jf3ZGkOflunQmnqtwq/j2l6BiYWVTDlupBC5Y5BZy1Q51WhEd1b5VhCn/dcPN+i7kWlVW
	P/fL+qh+2SfTSzqQz17w7/jOWJs3Cx28zM5whKAal+HiS4rFE/JGgwNx6KKC4EbLbCgERhJLwe9
	Z8S0o3lxV0chDnGCn6j1rpUlIYa4uRyFCv5PCxRK41KslAsF6oycCWU6wo975KFuKBuBwMb5GsA
	jie3SeD9M1+dzpr0pL+BczGdORJ48MAejdA9JG9Mw+tWX5zP+enEgVk4tHwVssNMxv/pt0cl0kp
	vIPTPEh4l2sQFAniwbMIPuhjk5QHEkK76hMFUmBLmLNlKu+LFaFE3KBkcYzZlnpCb0MNrsULDQ6
	A8e7YjVyPgmd97MUXyOnJbHNwCrsf8adIhMB7VM1N2j
X-Received: by 2002:a05:600c:1382:b0:495:699:5c8b with SMTP id 5b1f17b1804b1-4954a3e206dmr110350985e9.7.1784473701710;
        Sun, 19 Jul 2026 08:08:21 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edbe4sm220178415e9.12.2026.07.19.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:08:19 +0200
Message-Id: <DK2N4SFI9HSJ.26TX2WCT67ZHY@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/2] bpf: Preserve unique-field state across
 nested structs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260719142401.2420111-1-memxor@gmail.com>
 <20260719142401.2420111-2-memxor@gmail.com>
 <20260719143429.1BA8D1F000E9@smtp.kernel.org>
In-Reply-To: <20260719143429.1BA8D1F000E9@smtp.kernel.org>

On Sun Jul 19, 2026 at 4:34 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] BPF_REFCOUNT is incorrectly marked as non-unique, allowing users=
 to trigger a WARN_ON_ONCE via duplicate fields.
> - [High] Typo in BPF_RES_SPIN_LOCK parsing checks the wrong offset, allow=
ing users to trigger a WARN_ON_ONCE.
> --
>
> --- Patch [1]: [PATCH bpf-next v1 1/2] bpf: Preserve unique-field state a=
cross nested structs ---
> commit cc8eb6296aa42dface6bb303fbfdec9c1e0e7566
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Preserve unique-field state across nested structs
>
> This commit addresses an issue where btf_find_struct_field() initialized =
a
> fresh seen mask for every recursive descent. By sharing the seen_mask poi=
nter
> across the traversal, it properly detects duplicate unique fields to prev=
ent
> an invariant warning during map creation.
>
>> btf_find_struct_field() initializes a fresh seen mask for every recursiv=
e
>> descent. Unique special fields in different levels of the same aggregate
>> therefore do not see one another. The duplicate fields can reach
>> btf_parse_fields(), where they trigger an invariant WARN_ON_ONCE(). A
>> crafted user BTF can consequently trigger the warning before map creatio=
n
>> checks capabilities.
>
> [Severity: High]
> This isn't a bug introduced by this patch, but looking at
> btf_get_field_type() in kernel/bpf/btf.c, BPF_REFCOUNT is defined as
> non-unique (is_unique =3D false).
>
> If a user creates a BPF map using a BTF struct containing two bpf_refcoun=
t
> fields, they bypass the uniqueness check. When btf_parse_fields() process=
es
> them, the second field triggers the invariant check:
>
> kernel/bpf/btf.c:btf_parse_fields() {
>     ...
>     case BPF_REFCOUNT:
>         WARN_ON_ONCE(rec->refcount_off >=3D 0);
>     ...
> }

Will fix and respin.

>
> Can a crafted user BTF still trigger this WARN_ON_ONCE() using duplicate
> refcount fields?
>
>
> [Severity: High]
> This is a pre-existing issue, but looking at the BPF_RES_SPIN_LOCK case i=
n
> btf_parse_fields(), it appears to check the wrong offset:
>
> kernel/bpf/btf.c:btf_parse_fields() {
>     ...
>     case BPF_RES_SPIN_LOCK:
>         WARN_ON_ONCE(rec->spin_lock_off >=3D 0);
>         /* Cache offset for faster lookup at runtime */
>         rec->res_spin_lock_off =3D rec->fields[i].offset;
>         break;
>     ...
> }
>
> If a user provides a BTF struct containing both a bpf_spin_lock and
> a bpf_res_spin_lock, wouldn't this trigger the WARN_ON_ONCE() before
> reaching the intended graceful rejection?
>
> kernel/bpf/btf.c:btf_parse_fields() {
>     ...
>     if (rec->spin_lock_off >=3D 0 && rec->res_spin_lock_off >=3D 0) {
>         ret =3D -EINVAL;
>         goto end;
>     }
>     ...
> }
>

Already sent, but will roll the fix for this in this series.

>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index cbb1e49b9bcbf..8d628552ef99e 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>> @@ -3751,7 +3751,7 @@ static int btf_repeat_fields(struct btf_field_info=
 *info, int info_cnt,
>>  static int btf_find_struct_field(const struct btf *btf,
>>  				 const struct btf_type *t, u32 field_mask,
>>  				 struct btf_field_info *info, int info_cnt,
>> -				 u32 level);
>> +				 u32 level, u32 *seen_mask);
>>
> [ ... ]

