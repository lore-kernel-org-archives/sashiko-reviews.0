Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084686;
	b=bMYijXfaoJXnr2npTb5YaV4Z88+dHyKaDpJjQnj8xQPQ2jXEFf+GtTUmbRutJGwFLxc6
	 NHk6H9NibJCMf4hR9lqFtMmMzN7HzUUREZNbpOnuomzbRVJUCFBhlBd+ViW+tPoTWh+ii
	 3Esj7uXT4UqDz0ajLKzzaOus1t77ACPZ60jXsh0jZPHTXSk6YXgAAii31IKLoEFTMa1n8
	 2XiyJxUgAHQRBfg8JT3DBBKu4cZQQ7qtI3bIKaRCHBtwfMDzyLQGzLOAkEtt4mnOM0wUq
	 YviBTyHt6vX5oC3h34SW5icsUXItW2Nu7M98BWGMgHb3wSVB+Jwjk1dKVC5CWeiQ10Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=5Fl5cl1odyHR+Q+dHl3S9B8sfH7/8NbuHWc+9QJ6hEU=;
	b=CRDjxqsHtIdn5WPzoyD6wCnbVfWcIFjcredY9AhvoClfZbpWXNqqaxf7vZqSVFGxBedT
	 NqLMxz+TnMIv5v6lIy5JGxfmwBiLQSbUpSEKLg0SDaV+8pGTzNPDVVAzMmOqIHYtP6MLM
	 FTvvCrLs7QyUFT15KHf/V4g+xhnAsQUHV8l6Z90kcFaLvycoEVBqdEAdkp++VBJ8M8a5k
	 F5uY0sZo7Vz2R8jAPw3iS3qup8Qad7yUIudZgmQk9W91yQ5nKeWgWdH3uZgiKESdgzxJm
	 l+g6CCJW9NdlZLt4aGn4uIEFIutYXfWBuUP8nqmrgdpbjB/eQ5g5atIH7ZkP/VgYIYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V7oRK7RX;
	arc=none smtp.remote-ip=209.85.214.196
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C0606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 07:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V7oRK7RX
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2e9cf928dc9so2908345ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084685; x=1793689485; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Fl5cl1odyHR+Q+dHl3S9B8sfH7/8NbuHWc+9QJ6hEU=;
        b=V7oRK7RXDuCqcHtxh6bFg5oSDyxlSDNwOe3c3g4aqg929l2MkRvTqSQNVHJace4Vbx
         CkpVcgurHPjenIkUz1o6zo0F5B0dfq7nOMt5EK5gGh7uWQruUmOlcwSDfIbFMn/R9sUi
         juywrqWXKV/SQUL64QtiDESKcMUTQoDOTbkOnPWHXRRo+G90rCKHDXg+c6uZ6yiRJ4RT
         C4h8QK5uKpGZbZT2vqTtvJHoqqzHGLcnbMAqNwBriIbBaADBLn9YOI62AubKCZlq+o5U
         ZXmv3T4nErkNR00gEQfvnb0hauU+H9PlGexEkCH19DoiQLlJ47O29KUYyEssU7Egs5jL
         lI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084685; x=1793689485;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Fl5cl1odyHR+Q+dHl3S9B8sfH7/8NbuHWc+9QJ6hEU=;
        b=0JphwItFJypk0GyulVKtE6KE5QkxDkh6+NZJTdzcM2LRzN2YL7jzTPl06gM932qhyi
         XS4luQy6yrzOLJjDlA9/dIe7rcf6dHqVMYCsMn+HuvuC3k3DKbV+GPftUl5EeABNymcB
         gYo3M0mhsetHZghZz56KcMmAGhaT8J6tkjhdC7xlmjZ0FHGQbhSj7L/isTuZSh4TAyZQ
         of9Ja0f2Cjc1V3B1DvaniSso63OayDxWZnPk2bJR1JvREOr8vOx09pPbcvGEsvNV/06o
         Xuqe+c7lrup7IOxW/E7gAAdyRRM0O3mKbU0v+mIMkADtM99rS4LvQp59g/Fy1nZvH8y+
         pMsg==
X-Forwarded-Encrypted: i=1; AKwUvBw8G/hbxKfnzI1Ij2t5unqPCNRKTVIpQp/bBftzVVmCU1E2XXcOHHRn7V7rl02VS1W7MCsTBNb/fylYHIcomQ0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLT+4rmUxxvC3wWjuwY5zyOj0AxMP0rn6rgp1mUAoy+sZeZh85O
	a/lXhn1ZR4h0a0MZsSIzLGrkua0GivoHKclfI7AcyW764rMOlJESJw+x
X-Gm-Gg: AYBFou3mySOhIF+k2oD9ODdA71DEkp+zZyBwq0QO0S+gLgByaVmWgjQs2WcZHbChBB4
	9mDGA5E3DI1KQwZKa4NvRsjtov755vtzW5/LTG96xdP+7NBLCIy4jTt9qWb6dN2E1/PkXXMNLSq
	geG0SBz5t4+KeId0lXvaG06bvQQGZ4jC7s+tcI4o+CZrL5QH0CAYHPIepkweqLv1+ZPPi8oYH9i
	1gMnpjtR+vAs6FjzOH6L/5tsR5TB10s70Lyi3v84dhKAe+w8+GD2DaRjDgB0E7xMbDHjKvAGIrX
	crEecZ15CFkb4MithW7XiKB35SK6pgTipkjs5xqinvKw3mujlhjlDIPhf0ig4WvtaPazqQpCEXx
	rRAb33uyKG0dLz0eO6FmNnrJrQWmnTAXV76nLcRBXBQzBHpRt3dg+TKKAmP9jkalvwqZ8E7sgX+
	TKFrbBOj1P7i7btWaApPF2RhX7UPC7OqpP0uLecqX1xNnNLxWscAm+RAjEQprjLLTAFMyvai1rV
	NALWCkNNPcqvTNq9khvWUb+Kh/BsfwFuGO0/BomsbzARTZ+h063I4vBX9pTN6lDdziracRC2K/5
	r8lt+yUgold7FItHj0/LWnn2rqA9fGRbho1yLC7QIDdL4eQcrY4e
X-Received: by 2002:a17:902:f541:b0:2df:34c0:72fe with SMTP id d9443c01a7336-2eae402cc5emr11077445ad.35.1793084684710;
        Tue, 27 Oct 2026 00:04:44 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a69csm4484635ad.13.2026.10.27.00.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:04:44 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: Daemyung Kang <charsyam@gmail.com>
Cc: sj@kernel.org, damon@lists.linux.dev, linux-mm@kvack.org,
 akpm@linux-foundation.org, bijantabatab@micron.com, ravis.opensrc@micron.com,
 sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] mm/damon/vaddr: preserve migration weights above UINT_MAX
Date: Tue, 27 Oct 2026 17:45:52 +1100
Message-ID: <179308355214.2.6632342460755510671.damon-migrate-weights-review-draft@gmail.com>
In-Reply-To: <20261027035431.1007584-1-charsyam@gmail.com>
References: <20261027035431.1007584-1-charsyam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Daemyung,

On Tue, 27 Oct 2026 12:54:31 +0900 Daemyung Kang wrote:

> Sum weights into a u64 once per migration walk.  Keep the existing
> 32-bit divisor path for totals up to UINT_MAX and use a 64-bit remainder
> for larger totals.

Tested locally. Looks good to me :)

Tested in an x86_64 QEMU guest; both the buggy and corrected behavior
were verified.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
