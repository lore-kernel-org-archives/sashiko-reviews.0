Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833176;
	b=TleNvKhHEaklKZoLAaZjJtlWZ28LSAfCweOIG+oLFk3IcvFerUnqngTkbkDDyTvondaj
	 aiN0n9WCzUIs92Z/KuvzEra8djRO5DpOHFelCj/McbugBdYDm6Xqb3QUD1x0Cr3G6B+3z
	 yB315DAEkIErpasx7Z9R9+ikoBiyY0iJ/eJ0U9eghscl3nGqmEf22+VUdjsbGgvCfJJbi
	 DvY410DLd2WQjK17BeP8eznXUgoiZbgw1zGPlyUlCn/cAwZh4gZsjgXy7TgTYS6Tt37bp
	 J3SxWtWIM1/wheBchi8I857usXxnNGZEiX/Rag/g61Z+fK5JQg+Kz29yD7+YOgcW6Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
	b=q9R1L8TyBPbjxb6IKxRVdiYClb5V1smB+AM2E7jS6BTYRLJfWYC7e2q3HW8pLpc6nV5D
	 fmWIrsmlNs2HkvqwBOUSEhvNDrqU67pydlYxqd61WOfA3Vgl1BIIt7uk+BRgRqwLazTJm
	 OJyBVoAHwSOSupk+eju+SSX4z0O1Rfa9EVcOXaqi22F64HnEam9esp+jRf+HBp/YgOJ6c
	 2bnJbK36HE5bWl58fncD5TaD4aogioimarUGafXESE59fWkAXub+6CtfhRx/uJLK1imyR
	 tjpQxbH6AXN1ZqNZwIlx4zFuZxPcOmkovJQE2fKdcg/THQLffk6vf7YNIqxckq5AX+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETUXLJbp;
	arc=none smtp.remote-ip=74.125.230.136
Received: from mail-qv2-f8.google.com (mail-qv2-f8.google.com [74.125.230.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E0606A338
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 22:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291E0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETUXLJbp
Received: by mail-qv2-f8.google.com with SMTP id 6a1803df08f44-91e883d0654so6928416d6.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 14:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833175; x=1794437975; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=ETUXLJbp6LiPfpfIFwhP6PBmd8lU6T0lr411VNfwWYkCH0TWQ3TAn1iuV/mlF6nDPn
         ykfG8bve/B5Eg+238vJrzztMbb9MNFqp6tgD17YVgF7jYK84Q2v7hUqYV7QWkOUX6gRl
         OjpairSlFEn4ov4S4nT2n3W5drgqK4wJayoi6N1Yb6ItLiYQ/oZmQ8f3/J3e8ZTm69IJ
         YMkjHF2TRd66OlNSUciVt+z+jw+1nFh2CaYCaN265W22+ohxE8rHQlEERxS6bCD91AuQ
         h2IZ96ZpIZxggMJcYUySxc97GyDOzrouH4cVXpP3STw7fwlCqiAOlxh1ebjUkH+ZOobn
         Zcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833175; x=1794437975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=mdmxSu3nRC9ydouNcKGCJIl1rX+gq0i+oaxHV9jQ/rJmwGoMbXT+oDXry8XYzUKS5h
         HzrNJ7hktxpyqp79t/Ba91QFMmKgpwGO0EDQTsvffO8t3yZ6qLDTz7tEFs6eapHZCwVC
         DA/07rrpftlokasYBgAqmmYOlt5Tlk8eWzZbtEoHEMb00au7RFLtB8PBR8J1bP469VWG
         c+xtSRDL/wXFebAL+GznH1TLsa2X19XpQoQKgSng/erEwlhOL0MQsGX6d1OxQqy/3imB
         c6TN1ijXK4qeC+duKTex8lAfUBFWvfFx9UMCyH/sQGyCPu5u5k40MqxRSHKjPG3T6uMi
         j3Ag==
X-Gm-Message-State: APuU4Z8GmHHuvXBt5/kZlZKO66OXMkniiKpSxh/Rd7Fx38xb66x6Xe95
	9++4wYkKn+61rPgA09KS9OETg7JYWlnVEW3dvcLdBBrFHc8icLBrQL1qCiaHSI3v+rE=
X-Gm-Gg: AYBFou3OL1MzEXoN/mQPGHx2cym2hP64zuKlxwcs94FNBoXaDeKI/mKmqD4pgMGYKYd
	VhfZaTLnA6Ul0yBH2pN/5ai0m0iYNyfHWbi3GvQzT9KMeJ1CIAsbxW2uFszVGcif5M+/wTuGcGc
	LsPuMFxYn5PYEitwGJDKO2rcBdcEJpVms+jIoFbGftlFxKjrqvEnTGxSpZT5NnO4NXeixsR+OVp
	A/582B6XZlxDIISgWQUNHYSVktdZiLBbcLK2PPJ9e3ITNSfD7gZFPbIGDKT9sryCF94FwmF7Ago
	kj6c8urpSilV+cVVofQyuD5iAfXeDPTER0KkhPYsxNNpid8CnRs1/jn7Dl9ljoVPKA1V0kYZfNK
	QiId6ly4KtHI3FNWCELL1ds10Yu9t94Fv/+4WWg84qWPQxjlA8BH0oKbaRSPjaWd+d1/G49CAtu
	Jn/GTx2LFt9/EqrQR7CzexPNG4T3uZ4YuG3VOeye7n55xe5Lpb2Kq4zABUz+IMpIb4SjovDHXkl
	ATMpkinVHsEOHUOvKmGAAw3NfixsgyynwYuPvOmpJYpMrGcd9+hT9V2rRsq7+5bDE5J7iyEvlWj
	P9OsBX656lmyM2SHRCZCYqmu8WTy180M5A==
X-Received: by 2002:ad4:5945:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91e90741c7emr31183596d6.22.1793833174911;
        Wed, 04 Nov 2026 14:59:34 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfb4201sm31557236d6.10.2026.11.04.14.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:59:34 -0800 (PST)
Message-ID: <14067bc2-41fc-40ab-84be-adea737479ab@gmail.com>
Date: Wed, 4 Nov 2026 17:59:33 -0500
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
Subject: Re: [PATCH net-next v5 5/6] tls: send a KeyUpdate at the record limit
 and on request
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-5-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198141@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198141@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   ret = tls_encrypt_async_wait(ctx);
 > > +   if (!ret)
 > > +           ret = tls_keyupdate_rekey(sk, 1);
 >
 > [Severity: Medium]
 > As reported by Sashiko on v4 [1], can tls_tx_key_update() ignore fatal
 > transmission errors and rotate the TX key anyway when 
tls_tx_records() fails
 > with -EPIPE or -ECONNRESET?

Yes, but this is not specific to KeyUpdate. After shutdown(SHUT_WR),
send() on a kTLS socket with no KeyUpdate also returns the full
length. I tested this with TLS 1.3 AES-GCM. As I read the code, the
KeyUpdate record then stays queued and TCP does not send it, so the
peer never sees a record with the next key.

This corrects my note in the v2 changes, "The next call reports the
error". In the same test, the next send() also returned success.

 > [Severity: High]
 > As reported by Sashiko on v4 [2], how is the KeyUpdate state in struct
 > tls_context synchronized when sk_stream_wait_memory() drops lock_sock(sk)
 > during a send or TLS_TX_KEY_UPDATE?

No change, for the reasons in the v4 changes. I checked these points
by reading the code.

Points 1 and 2 need a TLS_TX or TLS_RX setsockopt() during a blocked
sendmsg(), which is an application error.

Point 3: tx_key_update_reply stays set after the update_requested
KeyUpdate, so the reply still goes out before the next Application
Data record.

Point 4: a record that was already being written can go out before
the reply. RFC 9846 section 4.7.3 allows this for records in flight.

Martin
