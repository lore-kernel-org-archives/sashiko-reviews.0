Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773289;
	b=RkE1numx+yvzN/ANJc+WLmZFIzJKBEYau2FI1KZTYDIxPyfmYBMq5jU/UT/bPcW1NyEP
	 otzkBtAIc6dgGFadmsO/7Ey7LhOhOBqJ/KWOiuX3ibQAIODNYU0C9Kx9wLUz2q5xuy4dD
	 IQ+AKcmcCsAKtz9AET7MTodaJJK6A4IWhoiTfFDLLjqDzQzkDDwEw//gh9nTQoYDQm9FA
	 sfyiaBxVmUjsB8+Ual8AuP2bQDvnUCqxi33CZVpPjjJl97fDheJj87nGC7UXFtRncRCmI
	 c8qj9tNGTs/Ms6u2DBtQ52VIvpoKYLfK3nU72UU5pAM0JM+kmrX8XYGN2cVq9tTTR9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773289;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=fEHLxHVmO7FJjZpKsvuinG1U7k9znbZ8wdMBda76NbU=;
	b=D+7F1nKm5KI7ZhUipj9EN+HBguoioOKT41+1x07vtw7LrwwZfMVAmwHAD1rLqq1Ag2hT
	 FVwBy/lqnD6rgX1o19LMmumdlgwySZsBzNwCIvdQa50MpAUJ1N3VxnrBmYbsVAMzpDA9F
	 VsBCPIHa3H9ewbO9NV3VsCCIV4WnEUsJGEtyNkoqhOXXme5464ZvmvMxinliLbwg8WOOB
	 WQOEc4IfYcjCXuZjzVikZUN++C28DDGVaWxa6MXrVvlTQswrTYM+6VeslRglmM9o/8333
	 uTGnawlAGZkOoV3EbrLZvDrBlEsIXbsuSXYTmGWjT85z6iwC4e7WHZ5iasR1vMA9oGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EOSEOZYv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFA606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CFA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EOSEOZYv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792773287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fEHLxHVmO7FJjZpKsvuinG1U7k9znbZ8wdMBda76NbU=;
	b=EOSEOZYvzF70kMvyhxevZnMpWuAmZ4X6p1lbnFf0+0E3i6DsABdoO9jOG6s9z96Evo/khD
	rR0TCFnGQxzxk3s29NKrR25BP3Py4LJiL3dH4PC5wseXgHOcRpDQU+favhK1gu4l5c8Uxb
	CL+6dKT1HUXySppoYiFMTrvLo+LzMZ8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-VAEcTnEhM7yE8EAb4VZ1kg-1; Fri, 23 Oct 2026 12:34:44 -0400
X-MC-Unique: VAEcTnEhM7yE8EAb4VZ1kg-1
X-Mimecast-MFC-AGG-ID: VAEcTnEhM7yE8EAb4VZ1kg_1792773284
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df5b058ddso690552f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 09:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773283; x=1793378083;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fEHLxHVmO7FJjZpKsvuinG1U7k9znbZ8wdMBda76NbU=;
        b=GUsstV83NSD3V5tBxy0qS1X1uAgVGy6FCNRW10h1KekpmdXfuyRVqvYL4dGI5ywJR0
         4/WOE6CRVSKlRxYBAEgwO4EiMhW0E/m/tBhpmBG6ARe71JA/GUxC2YiX2hBzmnThvEtF
         GVDCJhVwhSEP/T35WHrZ42iQYNkxfTvR5NyUGU2GZjjVUKkPxMx4clsFpne4hZmY8A2r
         eEG2k+WCM+QY7zYMJoEb8POwjoPQN8JXBVN0VuEl6Ljqysz6no9cOoCo3EM1CJg6qwJM
         w12eBoGwnw5gblQPhMFHguzezuyGLHHwAWDVUTCN5QfGlkK0tnoOiTzyCalTxVKZRyyG
         ApRg==
X-Gm-Message-State: AFq9FYJEv4Dh4M5NX15E2T98xJrvfwQE+uQIAAlqTJ+Fr//bBkRucbGk
	vZPll18v/Lt5J6SebS6UDC5NLYXisIOcvKKUoCfKij9l2kzPSs7tXA4oKaCnxFZX4QrLROTfH8P
	VtA9cY1J/ZpqiOhpv2BnYNAeLqlTAbNt0FJKvUCKC1vq/crO0DsiZ8T01ss9o/62Dux5htDcojo
	JWkgqNGGd/FULNbiIxt5pc0fekIJLELPloP9WhqSatU5hjrx4=
X-Gm-Gg: AYBFou14GceFug6/ZYiJmx9gX+M7AiFmYAzztuK3QIGUK+eOJNk2OzCc8usEXmN127I
	sw6zFyXTMcTLqZW1HxlfNS/Lfg5nF6wREy7KQLFctSwBwWu1asUIaR4La7SPwunUc1fOYfmsAOs
	TujHbgJ1gR7eUUbluVloOJQIPL4MIs89HeH/v4qLitTWnbpvfNZCyYoNoH2QhCkTpPn9Nf1anj5
	ZVyMAeGzp6PAFSA5OLxZoAWWt0gf2LosSpRom0Te0D1od2zI1+fRzq0MjSqceuM04IKmsxgIo68
	HFEj08hLXr0HeeHfNg20n9uN05ScPV4dL8BJW2FghJiXMiNktSnyYADs2bruINS6v5hO15E=
X-Received: by 2002:a05:6000:2b12:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e385962ffmr3200832f8f.28.1792773283421;
        Fri, 23 Oct 2026 09:34:43 -0700 (PDT)
X-Received: by 2002:a05:6000:2b12:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e385962ffmr3200797f8f.28.1792773282701;
        Fri, 23 Oct 2026 09:34:42 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d405cc0sm789801f8f.30.2026.10.23.09.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:34:41 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:34:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Cheng Yongkang <teel4res@gmail.com>, virtualization@lists.linux.dev,
	Eugenio Perez <eperezma@redhat.com>
Subject: Re: [PATCH net] net: virtio_net: decode tunnel csum_start as
 little-endian
Message-ID: <20261023122951-mutt-send-email-mst@kernel.org>
References: <179268538303.70821.1734486381476363942@gmail.com>
 <sashiko-outbox-182939@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-182939@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NGZnxWC522iimKN73hhNwHQRrs-rdLtwdpiMKxBanS0_1792773284
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 23, 2026 at 04:09:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] net: virtio_net: sparse __virtio16 mismatch in virtio_net_hdr_tnl_to_skb()
> --
> 
> commit ba7ce0ae4b2dfb77c6b110ada68faaf66de9237f
> Author: Cheng Yongkang <teel4res@gmail.com>
> 
> net: virtio_net: decode tunnel csum_start as little-endian
> 
> This commit changes virtio_net_hdr_tnl_to_skb() in include/linux/virtio_net.h
> to always decode hdr->csum_start as little-endian during tunnel header offset
> validation, matching the subsequent call to __virtio_net_hdr_to_skb().
> 
> > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > index d6466f96cdd00..ddc6341747e53 100644
> > --- a/include/linux/virtio_net.h
> > +++ b/include/linux/virtio_net.h
> > @@ -324,7 +324,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> >  	inner_l3min = virtio_l3min(inner_isv6);
> >  	outer_l3min = ETH_HLEN + virtio_l3min(outer_isv6);
> >  
> > -	inner_th = __virtio16_to_cpu(little_endian, hdr->csum_start);
> > +	inner_th = le16_to_cpu(hdr->csum_start);
> >  	inner_nh = le16_to_cpu(vhdr->inner_nh_offset);
> >  	outer_th = le16_to_cpu(vhdr->outer_th_offset);
> >  	if (outer_th < outer_l3min ||
> 
> [Severity: Low]
> Does passing hdr->csum_start directly to le16_to_cpu() in
> virtio_net_hdr_tnl_to_skb() trigger sparse endianness warnings when building
> callers such as drivers/net/virtio_net.c and drivers/net/tun.c with C=1?
> 
> Unlike vhdr->inner_nh_offset and vhdr->outer_th_offset, which are declared as
> __le16 in struct virtio_net_hdr_v1_hash_tunnel, hdr->csum_start is declared as
> __virtio16 in include/uapi/linux/virtio_net.h:
> 
> struct virtio_net_hdr {
> 	...
> 	__virtio16 csum_start;	/* Position to start checksumming from */
> 	__virtio16 csum_offset;	/* Offset after that to place checksum */
> };
> 
> In include/linux/virtio_byteorder.h, __virtio16_to_cpu() performs the forced
> cast from __virtio16 to __le16 before calling le16_to_cpu():
> 
> static inline u16 __virtio16_to_cpu(bool little_endian, __virtio16 val)
> {
> 	if (little_endian)
> 		return le16_to_cpu((__force __le16)val);
> 	else
> 		return be16_to_cpu((__force __be16)val);
> }
> 
> Should this use __virtio16_to_cpu(true, hdr->csum_start) instead, matching the
> __virtio_net_hdr_to_skb(skb, hdr, true, ...) call below and
> __cpu_to_virtio16(true, hdr_len) in __virtio_net_set_tnl_hdrlen()?


Ugh. In fact it does. Should be __virtio16_to_cpu(true, hdr->csum_start)
and I had exactly that in v5. Not sure at what point I picked
an old version of that (

It's just a warning - functionally the same - so if v6 goes in, I'll fix
it by a patch on top.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/179268538303.70821.1734486381476363942@gmail.com?part=1

