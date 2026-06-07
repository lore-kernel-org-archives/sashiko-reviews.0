Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FADF27603A
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780816341; cv=pass; b=KsMWBS6xH0+0l6RaPtFM9uB/VW1ZLsZTgeO+aWXHvlUDF9+Sb4WGXO5a7JVl6y7mL48BHw2Z1KW6HY/MbUFF7m5q6BXeyVJ0WNfiFrFj3+LzJ+kHBPJfk9MZmxff7GvUcTTLfzwdzH5RDjfmNO7yM/FNF+BVc+vhgqn8O596daA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780816341; c=relaxed/simple;
	bh=G7luavM/r2nql26XEifNX/X2mZPj9YNSfOeR7LbWUBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRdW5I4yjvOsSbIM+J0W5aBKhMiFAXFVMfpxzOt5/JdB4u7brr5ni0nZsMDcCCZ7J0cjK2jTsB8S0//HA2vtHsSR9iwW/65pr5SnTqO6QyPUIBsV1GdLcKLUU3jkC3RpfdV/FubBMD19dHROmUvSrWHFD+BGY0a1m35Lv/7YkkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOkL/6/n; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOkL/6/n"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec405a6ea5so467474666b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 00:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780816338; cv=none;
        d=google.com; s=arc-20240605;
        b=UBBs3WswKfaFYCBCRTb9JLks1XQgNOTKmWvhM/UKGhtVilY/yAXybmzRGKpVkTgAlx
         VaG18STUsANDM68EH/UYbIiWKlmzrZ6dqeEtBinBvGXlW/NOV0DD/ELbezMfnPW8m3rk
         2YclYjxWGFpZ9tJHrrsrT+kpigHax8ON+oOldYI05pqjc/rqUhFkjtm+geneL8k9oSSE
         eEnkUWxPLBf7Su5H92N9x12X7xKv+MsH1Jl0NZuGSu/V0FxtoUsa9zeTzvPuAw90LL7C
         5VJoSD5VVBIBT+byHCsbS9dt0bkQqYp3Buan9fRkuRPTpVNIU3Mzx7DTNclpWqiDRU98
         uixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B0ckcyoETbXT0qw1CXSwY+Cor9uhDO3R8JWwhYej1Us=;
        fh=78L2agMsSesHOvC78om5KEJtFFOfp01JVxLjVZJw7CQ=;
        b=LiV2KBJsqXQYJ/21QcC971ein1pQAMsSaTSee/LwgfyG/Op39+I4IEf87rgNXOZn1z
         axA483mCedyI93mMDfdGRYc6SLgUvOJBZ+W8bp0zKG6uBmWN+mKkczcM3QypAFwo+ZRj
         tF2cAmU4f6mygHu/+iDPbE5oFnJnwU+B8wmQ41l3oF3qlz7MngL6z2Rmqxb0S6c+sy6t
         cm39oVz2vyj5qFT8+DPRchzO5L9wjp/xGQC7wrpjR0cPCBCN2kGu68Stjk11RNjR8WnU
         0pDa3upCM99RjJ4h0cO1B5/R+J24KDUlFzQfzfgDefC5wcmQTorpvyFQhbkS3nHQqjI3
         dTqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780816338; x=1781421138; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0ckcyoETbXT0qw1CXSwY+Cor9uhDO3R8JWwhYej1Us=;
        b=NOkL/6/nyeYRij+m92ZeyNIeeHvyHBe/Y17HkLeK8LLrNFu8VnJTDHeaGXkQmZBemw
         gZCwp6Yxj8Ir6lO73bGPQYNKov4QP0xx8fZc0zseok9fvw6PKXj6xuHAdI1X2e4eCUB0
         nWQ5FVlp2d+6krQBfRlkbff+JSR1xM5PNaKXYXhuVWaX+d8xQh7d/Pl83NktCuLVGHzM
         HnLq0dkQ1gGSZIAi6TkIUU/0VIYMCgrH0qto5L/5HUTxcmbDzlRLAN1jsQ7KaYR5/JLK
         +T6+1hg1s3/bZcF3ljSNhfq/ZNP0u/krZRJGj1jk0WMqK2OvJ5eF5kl0Tlgex5Wsr+3b
         v0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780816338; x=1781421138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0ckcyoETbXT0qw1CXSwY+Cor9uhDO3R8JWwhYej1Us=;
        b=gl8xUE0csUimzuwfps2rXBbcxUr07m8hu8bz2D4Uc4k78zHILnvKDouVTOuPX5eUCi
         +g6cE5ASd+keuP+AirLGIBViwTzBEL66PV3Qr8bvYFjfR9cxai9So9p7S8HRK+2IGuTw
         KDdBlZP5uQVo4qEOUTD5OPpz4TUifBXBKKfYymZn0R+oJo3W2X3b9thZLknh9TlMaz3v
         FiNAEngrMkcSpAD+WLzNW2qUsboRifjoLXDV73Ut1iAvO4OdL6JPfBfdNNlEdSHRyj/0
         ZHjGGRpQMEGQv3bB2H2dUCYo6/n5WzaFgnG+zVoXklkY8OJ0S1PXvg1krELWp2L3U1AU
         wXTw==
X-Gm-Message-State: AOJu0YwkWlenq7aSjBQ0zLUQ/BzSaCzb0MwKJslUlolpEgKRtn+dCB10
	lDNGgSOtipJWTIlpqfmSdOaNh0CzNsK+jFkeHdfCJ/E0yJQYQGMiIoDFLGHs0ohbglLZ8PrlWYQ
	fDrvTgNBn2M/xkpbSk/snYPlN5ctKK+MBZ8ezwahPM+ej
X-Gm-Gg: Acq92OFtmQogthFnTLltzXH7nJ9eveMlPJBXpBO5GyzQnUGnEVSRyWRUye758XzC8X2
	h2LXIO5hQI8D2Hy0nZegQ2EtdGTOS/X94X9imh1NVt8osN10nMqvnq4QdT15ndtQCb5ObATkyjF
	yE92DeMcHwFEqWK700M5cRrppvLY2XwKVPEChNcm6GdEPO3NCsT/IWj7TXH3MqvtIuHWmHNmfTZ
	vbMoUewH6G3QK8q5VoGZeSVfFb+sT/22g0bYGBDvVLF81/BQDslMqrukxhQqQ0x2TVemadPdBYn
	kOSlQqxhRuqEDBo49DpZ3rqahXNF4xcAcIjkNJNOmMDSMQzVD/BBr5cg6J823w==
X-Received: by 2002:a17:907:971b:b0:bee:bbaa:f19d with SMTP id
 a640c23a62f3a-bf37057b43bmr467387166b.14.1780816338088; Sun, 07 Jun 2026
 00:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604134019.39161-1-yimingqian591@gmail.com> <20260605134041.623E31F00893@smtp.kernel.org>
In-Reply-To: <20260605134041.623E31F00893@smtp.kernel.org>
From: =?UTF-8?B?6ZKx5LiA6ZOt?= <yimingqian591@gmail.com>
Date: Sun, 7 Jun 2026 15:12:06 +0800
X-Gm-Features: AVVi8CeiV3ArOCRHeHEGu_Jx0-sEP06IN1T27ooceEn3WQ_RqB_prKHofa4QHtM
Message-ID: <CAL_bE8JcBEg37HDj7ri7b9g=VMS662PFGWCzA6J0msCA4oHZBQ@mail.gmail.com>
Subject: Re: [PATCH net] net/tls: preserve sk_msg sg.copy when splitting records
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, Keenan Dong <keenanat2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

  The sk_msg_shift_left/right issue is the related pre-existing sk_msg
  sg.copy bug that I explicitly separated in the report. This patch does
  not attempt to fix that helper/shift transform site.

  This patch is limited to a different transform site in kTLS:
  tls_split_open_record() copies SG entries into a new sk_msg but failed to
  copy the corresponding sg.copy bitmap state. The fix preserves that
  metadata only for the entries copied by tls_split_open_record().

  The other findings appear pre-existing and independent. They should not
  block this focused fix, and can be investigated or fixed separately if
  needed.

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=885=E6=97=A5=E5=91=
=A8=E4=BA=94 21:40=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] tls_merge_open_record incorrectly merges naturally contiguou=
s scatterlist elements, leading to a page double-free.
> - [Critical] tls_split_open_record() ignores the split_point argument, le=
ading to an out-of-bounds write in the crypto layer.
> - [High] sk_msg element shifting functions fail to shift the msg->sg.copy=
 bitmap, allowing BPF to overwrite externally owned page cache memory.
> - [High] sk_msg_alloc reuses freed scatterlist indices without clearing t=
he msg->sg.copy bit, causing valid memory to be treated as read-only.
> --
>
> commit d2043cc374b476d5c2b7d9a3d811593ca2bebf5c
> Author: Yiming Qian <yimingqian591@gmail.com>
>
> net/tls: preserve sk_msg sg.copy when splitting records
>
> This patch modifies tls_split_open_record to correctly copy the sg.copy
> bit state from the original sk_msg into the new sk_msg when an open recor=
d
> is split. It introduces a helper sk_msg_sg_copy_one to facilitate this bi=
t
> copying for both partial and whole tail entries.
>
> > diff --git a/include/linux/skmsg.h b/include/linux/skmsg.h
> > index 19f4f253b4f90..f3988ce2219db 100644
> > --- a/include/linux/skmsg.h
> > +++ b/include/linux/skmsg.h
> [ ... ]
> > diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> > index 964ebc268ee46..434753de8aadd 100644
> > --- a/net/tls/tls_sw.c
> > +++ b/net/tls/tls_sw.c
> > @@ -623,6 +623,7 @@ static int tls_split_open_record(struct sock *sk, s=
truct tls_rec *from,
> >       struct scatterlist *sge, *osge, *nsge;
> >       u32 orig_size =3D msg_opl->sg.size;
> >       struct scatterlist tmp =3D { };
>
> [Severity: Critical]
> This is a pre-existing issue, but does tls_split_open_record ignore the
> split_point argument?
>
> When a BPF program uses bpf_msg_push_data to expand a payload beyond the
> pre-allocated encrypted buffer capacity, tls_push_record calculates a
> necessary split_point and calls tls_split_open_record.
>
> However, tls_split_open_record ignores the split_point argument entirely
> and unconditionally sets apply =3D msg_opl->apply_bytes.
>
> If apply_bytes is 0, the function effectively splits at 0 bytes, creating
> an empty msg_opl. The fallback logic in tls_push_record then merges them
> back together.
>
> Subsequently, sk_msg_trim silently fails because the size is larger than
> the target, and tls_do_encryption uses the undersized buffer to encrypt
> the oversized msg_pl. Can this cause an out-of-bounds write in the
> scatterlist array when constructing the crypto request?
>
> > +     u32 tmp_i =3D NR_MSG_FRAG_IDS;
> >       struct sk_msg *msg_npl;
> [ ... ]
>
> net/tls/tls_sw.c:tls_merge_open_record() {
>     ...
>     if (sg_page(osge) =3D=3D sg_page(nsge) &&
>         osge->offset + osge->length =3D=3D nsge->offset) {
>         osge->length +=3D nsge->length;
>         put_page(sg_page(nsge));
>     }
>     ...
> }
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but does tls_merge_open_record
> incorrectly merge naturally contiguous scatterlist elements?
>
> When tls_split_open_record splits an open record exactly on an element
> boundary, no extra page reference is acquired.
>
> If encryption subsequently fails, tls_merge_open_record attempts to merge
> the elements back. To detect a split element, it merely checks if the
> pages are the same and the offsets are contiguous.
>
> If the user originally provided two elements that were naturally contiguo=
us
> in memory, this condition falsely evaluates to true. tls_merge_open_recor=
d
> then adds their lengths and calls put_page on sg_page(nsge), improperly
> releasing a reference that was never taken.
>
> The element remains in the scatterlist, resulting in another put_page
> during destruction. Does this directly cause a double-free on the page?
>
> net/core/filter.c:sk_msg_shift_left() {
>     ...
>     do {
>         prev =3D i;
>         sk_msg_iter_var_next(i);
>         msg->sg.data[prev] =3D msg->sg.data[i];
>     } while (i !=3D msg->sg.end);
>     ...
> }
>
> net/core/filter.c:sk_msg_shift_right() {
>     ...
>     while (i !=3D msg->sg.end) {
>         msg->sg.data[i] =3D sge;
>         sk_msg_iter_var_next(i);
>         sge =3D tmp;
>         tmp =3D sk_msg_elem_cpy(msg, i);
>     }
>     ...
> }
>
> [Severity: High]
> This is a pre-existing issue, but do the sk_msg element shifting function=
s
> fail to shift the msg->sg.copy bitmap?
>
> BPF helpers manipulate sk_msg scatterlist arrays using sk_msg_shift_left
> and sk_msg_shift_right. These functions physically shift the msg->sg.data
> entries but fail to concurrently shift the corresponding msg->sg.copy
> bitmap.
>
> Consequently, shifted scatterlist elements incorrectly inherit the
> read-only states of their new indices.
>
> If a read-only element is shifted into an index where the copy bit is 0,
> sk_msg_compute_data_pointers will erroneously provide a writable data
> pointer to the BPF program. Could this allow an unprivileged BPF program
> to write to externally owned page cache pages?
>
> net/core/skmsg.c:sk_msg_alloc() {
>     ...
>         sge =3D &msg->sg.data[msg->sg.end];
>         sg_unmark_end(sge);
>         sg_set_page(sge, pfrag->page, use, orig_offset);
>         get_page(pfrag->page);
>         sk_msg_iter_next(msg, end);
>     ...
> }
>
> net/core/skmsg.c:sk_msg_free_elem() {
>     ...
>     memset(sge, 0, sizeof(*sge));
>     return len;
> }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does sk_msg_alloc reuse
> freed scatterlist indices without clearing the msg->sg.copy bit?
>
> When sk_msg_free_elem or sk_msg_trim frees a scatterlist element, it zero=
es
> the sg.data entry but does not clear the corresponding bit in the
> msg->sg.copy bitmap.
>
> If sk_msg_alloc later allocates new memory and reuses that same index in
> the ring buffer, the stale copy bit remains set.
>
> Because of this, sk_msg_compute_data_pointers incorrectly assumes the new=
ly
> allocated, writable memory is read-only and sets msg->data to NULL. Does
> this abruptly break BPF programs that rely on writing to pushed data?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604134019.39=
161-1-yimingqian591@gmail.com?part=3D1
