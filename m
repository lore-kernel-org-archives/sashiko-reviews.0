Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690203;
	b=xELM3bYzgifTD7Gn3TX2W/yFTax1ZuJ7mQ4k5TDQgIO77knhYX0eV7w7zT63lT2nKs0W
	 mBNVfOQoy6lox/WuuON0VfBjY9Ot/rZ+J/OjufgpLeP5Pfb8K45CV66cjdo6BHzDe0ouS
	 irUNUU+apASU05ZFk6oTQPqpAxFtJbHOWiNhBeTg2M2789JdZHe6iTiTsoF2doDOCQ3dx
	 vNcpOF3+5NotVQqIAUPsxrQCW8HAmX/G8pXOi//R8HCOdhbCcD/qFx5NQl1/jsXlQ52aw
	 8UG1s5jzfsuD2y5nNoGIVFvKYbBVCda8o7SpPS/k4kkIMT652NrHEa62hvYX6/UpgxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
	b=xPBfpnEbS4gIGTFuU2X2kFAWv6ff3ZzrhgszQ4wSOAJzMp+P2LmLcLOubuMlN5qxsR4b
	 9livGfABu5JXo9SXc/X98VOtB4Uu1/EZaPO73eISeR/248Ez2LxCWmLdYGKH/7RhCL5v4
	 ocJFXLaluj5ri6s0bZLEsCFR5x9OM3fuwMHAa5ZkRoGZgo/GcibD70EdbJgvAoeiBGRs7
	 CLrH2lzz18FZQCVNM31gbWxe0HmyQ54fNFo2bA09PLlkUbHjAy9R/9OPzT8XBQcoWy+P4
	 cLj+XWkk5Xl8FfJHWsNlYSVaFya9b0wbkZVUppQcBR6ibQqt4++YsSLwJouWzarLOtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="ZOwUyH/p";
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE2606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 17:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBE2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ZOwUyH/p
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-917c04630c2so1344306d6.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792690202; x=1793295002; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
        b=ZOwUyH/pdQi7uzmuR5TCPCaQ2WEka/jXRzE/Ziwwq8Vte4oz3Ka7bQMXjKByFvnn/A
         JiLqbjMqf2aYpqE240ISnX8IYlBDqAPwICjh0gOxTDqnHrAcV9RswBjQWUyFPt5OR8oN
         QbEvRqwi5+a7GdUHu7TBBVCIXfydhPy9Mt7E5uDqZf9gY3fJ1VQMrHoFWZm8cNZOrQci
         o+J6SBXQ/iEoxcl28dERAtCy6i8HB2ATOhixc4N/Z+4SmmGZUCEPSBzihiiNMT0ViNnN
         iIOnWYa90zaxyDFDkJTCDxXhIXhYx0l56w6pRCm2VEbapIGARMvyTmiTaXBtsyJIeE8D
         T9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690202; x=1793295002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
        b=a+MQAD3Czl5QKg+Aaxrw8UaGlgeL7uqj8n/Jw4sKm0yfHn1OOlJAABn3sFOr8XKSh6
         wyoyIQHn5IqDSYNiCLe/8iXgKp31+DD3vhMtCc6PoR7S73O3YEFg8tfGu3D3Dst9Bdol
         YXzsG48jofm9gOyEhKeYpIGkIdAqbsc3wQKKuoO5ANUIvuAoheO8rQsTSyEZx+HVnTec
         8SUwCUJV3Lni8AFA4XwOO5m3K2vGvW9ySe36PRPAj4jVkQ+Y7I12M7WnROJpa4Q42bbH
         BElj7qG+RtNnbgqXTLi82UAwWRz0N3U40e69njYpyvB8vmNNq1y2mYHgGz59Ag2ySsr7
         2UYQ==
X-Gm-Message-State: AFq9FYIyROsWSwWPkjdbT0ybwJXxsva6YSzAu6827WaR8QcNfr4cGCZa
	dcavJKGyDQwD0NB6IHpdsHJsg5TZICt/V/Ri9FwyY9zqHC5JhVm8iYZfi4SYedcTupbHAeJsuQb
	qb6AA+A==
X-Gm-Gg: AYBFou2x63I6xyIuvdXo9b3iMGWZcwQDf8o4AN1QcXv7of9LAecTtfm3HlNmkWdW1bx
	paGUknHQmjrut3/sv2MbYGeFIcWmoX/71umdii9+kVLnRd/7Q5NqCfXlziik7sSvjcREn0lpAEc
	3A3md3gu2LGyzMOsfm3l8E5OjmGWf5MACVti9m9qYFt9jP8TrgAbkevC/wxiPvNOKdTw1qwSxaz
	OiJvC2E+/a72UejPgmIBFRteieXsb5B7g4o7Z/ntj/b/L5pB+kXAv3iFFamB7CdRTGILvrvQ3oP
	b0BEE8bpsz73+25y3TX3YdPAicUuFk3CQJN3gCtRMqpziqXASzC7uou2QhKtJ3EpLL7s/GhD/ZF
	o7k91rYeWVk39Q00VblwPE30WtTnvkNAQKSKhjN95im26m1u6rESefCxr/4dMd0x0Zp1PNAZpEo
	bi8IHY5pa394FshvHtugumdyFhFLsJfen5AOyR0L54rSWMQDMN1GnUICPK0hqrZqRUbAalUopAt
	8d7M7JU8+HlQCLdnp0TPRPqR8TQJyEkDsNyr/0jIvL8lXPgAns/OYY5ij2phQ3xZxc2oEXe1sHT
	SUO/LmwZkJhIdh2HV3CprHKx3kxAC2RUYvz7UMmlVrva
X-Received: by 2002:a05:6214:1308:b0:91b:9496:6a18 with SMTP id 6a1803df08f44-91c12f325a9mr106495486d6.37.1792690201641;
        Thu, 22 Oct 2026 10:30:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c36f0b09fsm2630646d6.4.2026.10.22.10.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:30:01 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:29:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: sashiko-reviews@lists.linux.dev
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>, linux-usb@vger.kernel.org,
	sashiko@lists.linux.dev
Subject: What happened with Sashiko?
Message-ID: <885b39ce-b85e-44ab-abfb-797e4dc945ad@rowland.harvard.edu>
References: <179264120148.17277.68253767316647311@kylinos.cn>
 <179264121921.17277.3541477544711634211@kylinos.cn>
 <sashiko-outbox-180999@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-180999@kernel.org>

Did Sashiko just go a little bit crazy?  In

https://lore.kernel.org/linux-usb/sashiko-outbox-180999@kernel.org/

the review of a submitted patch ends with these lines:

On Thu, Oct 22, 2026 at 04:21:02AM +0000, sashiko-bot@kernel.org wrote:
> [ ... ]
> 完美! Let's wait—did I accidentally write `完美! Let's wait...` in the output?!
> OH! Wait: I was writing the actual response, not thinking!
> WAIT A SECOND! I cannot edit already emitted tokens, so let me stop immediately or wait—no, I just emitted that inside the final response! Let me end immediately with a newline.
> 
> []
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/179264120148.17277.68253767316647311@kylinos.cn?part=3

Do LLMs have some sort of stream-of-consciousness?

Alan Stern
