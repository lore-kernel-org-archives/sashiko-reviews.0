Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773621;
	b=Vo1bNDCRKr7T5jon7/c4xqi8Z13uKSCdba98ac3Mdo2Z4FQqfGYeyEWCN4ThzS3zggm3
	 LQG7RWnn03VzalDWG54Ok6j56o9+ePy5tImOx1W+H0OK5MftHww3gQ5ui9frnL0qlADF6
	 c5lYkfWEEeX/Ip/LL+DmL6DTtSt9CzMAj0DhHLvLmsiRTA7/1UKNG/Cqw8BDMcJgetLi9
	 zOUn1oKODiTVkWVOQ//60FhlMJcoKnZ4FJjTh1RAbH59sxv6ZGU2JfSJNFPZahfmgFQrS
	 mLpGm8eKaKZtEs93h3wq16YwHSlEbOBpYfrq/fI74PiPfMzQ6/A3yRKwVn9Cu+QOdzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773621;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=ahjTpkvsebEzgSsBGnOTA13+FZieyFL43I5PSnK11a8=;
	b=Fwgnyv6NHFFVVGltc3EpaKm+EWgbZSfoSlfa7WIsd1r0iuK8MFkA6EFSyQB1ophZzyD/
	 N65lA89xzT5ZYQx/FhT/ND9tDolt3UX85Js7SpIlB/kOavmbvCCMDcMBAM2zuyR1v+c8L
	 XOhCQjoaQ3hAA6U3Q2KhRWt1FRn01N3mJBoZTAllXunTMgl7tA9hZimNnDduVXRC1YRh3
	 d3sFegijCxRHnMfUjuy2WyX2Yck5sMFqnTmY1YnRA8vNEY+Ri98l3OBmMu6ca9FPrwlwo
	 JnahUb/077Hlm0BWyZ7UTIpkhycJEnZmE1UqYe4c9PWccfNb1jzVRtVOY5bGzxtRCmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eF4cwcBL;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E61A606A31D
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 16:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E61A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eF4cwcBL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792773620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahjTpkvsebEzgSsBGnOTA13+FZieyFL43I5PSnK11a8=;
	b=eF4cwcBLIAmnlYXIUzq8jAQMiwUNqBvGcy1C7p8YVN+keCUQQwc32Hi+oHwAiopwI41WM7
	Z+JxySSB0Hz+2ecDHb1NNOaO2sJw/3r8zvUFZMfBWilXcNFX7YVceE1gq3Ch55/j8A/vK3
	btYJfdWWoz+ucSDP7jBJRNT/dD20kmM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-fSJ4YxqdPImGy_LQV3oIgw-1; Fri, 23 Oct 2026 12:40:18 -0400
X-MC-Unique: fSJ4YxqdPImGy_LQV3oIgw-1
X-Mimecast-MFC-AGG-ID: fSJ4YxqdPImGy_LQV3oIgw_1792773618
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a211bff50bso6675795e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 09:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773617; x=1793378417;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ahjTpkvsebEzgSsBGnOTA13+FZieyFL43I5PSnK11a8=;
        b=x/76WwdMU7N9HjTo1MMcNU1L6FUEw8DosMyeGslBY1bf41S8PHdxBhoW7KDQ3wI++h
         RDcBUus8n5FSiGDz75BHN7ydy2htqqzDXn+SaIyHdt896lvJu1VsoC1SRcOuYh3b/VtH
         G4IAUNWoAbJUVNwQ77X+SolJdsAYwML0QunnaWCdOGTFGAg/nGFQakJsb+WonLH/Go5x
         tk+WQ3iCjvOpq8mqyTeBpIiN6nuFbb/hq9WAZfuUbfkWagwxfBKYLTZ+DQJVHlNTbnvm
         EvT+6ZGXoNMY8ub2GtA5/rqRqicbi5lpIcHIsoiaQ+1pcW83hrEf+P7qoFLdUonMmPtO
         205Q==
X-Gm-Message-State: AFq9FYLuElgu0I1VomOpn2MR3EG/S6J+vs8sOsEWEhh9I/y8CbQrNe7i
	ELdooUS7CIahDtYsZnBTxNcBeKxh21AA/KpAFq05z57C2kH6uE39XUIQR6EvrwnjuYVtKtYKybx
	cIA/RFCgFmv30ifIG8V9z48k92PM5EdVGdyua4V65m07+orUZYbNteqWCobwMwHcRjKI4lUGA/U
	eSMeS/mabAb68JlsWdUW2MKSuCqy8oB11mYEbzNTXXK5xLazE=
X-Gm-Gg: AYBFou07wiNJ8gZPXX3fGkjbF1n9/yCJCpGeD8VnKDrs7q7wOqxDp/EiXaey1mo7Fk1
	1ddxSZ2nKkkwbsZX7goFc+Srzg2+wUjCXDiHARy/mEt2FXM+cYG/nOhx9JbCH7G1i7I8vGQ914v
	U/140Po5K2sLiMh8nbtuvMXItaULL3QPa0c/3y4rNc00Qzh+3oVpt6S78M+3rrgrgyN+OXH/e+1
	SNQXIUpLRHdoKWNucH5mAM9pHbIvSplTUbZr1zhZsdlhQOeATYTpGUQQfRecS2p1fa2POsXFe7w
	SgRPbs1X+XIkUZ6YAJ1fQlC+2JxAfNFUqbP++DqucPUl1ahzrq0EWarzAs+kskp7olcVvSU=
X-Received: by 2002:a05:600c:8b23:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a211edccbbmr46397835e9.28.1792773617490;
        Fri, 23 Oct 2026 09:40:17 -0700 (PDT)
X-Received: by 2002:a05:600c:8b23:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a211edccbbmr46397475e9.28.1792773616868;
        Fri, 23 Oct 2026 09:40:16 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fcdc63sm5911635e9.2.2026.10.23.09.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:40:16 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:40:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Cheng Yongkang <teel4res@gmail.com>, virtualization@lists.linux.dev,
	Eugenio Perez <eperezma@redhat.com>
Subject: Re: [PATCH net] net: virtio_net: decode tunnel csum_start as
 little-endian
Message-ID: <20261023123931-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: dsdO8eaIek4KgrPAHSa7u45x3jQ_8TKI0Gb21z20FJw_1792773618
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


Ah no wait, this is not my v6. My v6 is ok.


> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/179268538303.70821.1734486381476363942@gmail.com?part=1

