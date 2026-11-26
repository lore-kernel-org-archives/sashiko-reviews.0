Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711783;
	b=sVfnDCgnmBW9rGEXaKD+Gv9Acn+IOsX/jizL4Qnbu+MT/rlpheNoPeHZfLwplIozzYe9
	 H5qZQoW59SuKmtHKpaEHLz8DMtD79Cxfhv/L5567BI8AgsEmr2hJY0+6IxwNfiYPiIYk+
	 stVUNkYJVV7+KZTenVy5TGAPT5krz3MvxGOmZNywBxxnRctj/j5HveGNA3PYI3h/p/YrA
	 Uff0XBAVsLhr7zT566MsTlen+X1mzlpB919UpxbZm2tDDy0pOTxrXVVYhviFZe8SIvbEi
	 B3DFwoAiE010485z/CK51X3t/EIn7Qdk8W3AV0uOppdp3tPg/Nykz/m1Ki/hvMPoXEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Xn3AbwEHXU3sQNg1nNqXcaifYswIT1oFNQRvMaw2t3k=;
	b=MnN+npMx1/fOMyMHLOo+dM8vqTY961AfHk0Q9fNcEh3gMLiciDtNpaMeUCSz2KZt4VDi
	 zAqdlX2VMu3isyzCM6TOoTNGkpD3aJhzfSCgMUX0jXCg+65GkITBxsq9pYen6MCNtHGo6
	 Y7+igdmzoj/8toZOKF+WbBoLJgBWUM1IufUzxNswOZuym/5652j7QW6zn3H1U8bg1OfKU
	 2SE3Lr0Q6a48hhB/smaHQmB1NR1tF8QHv54ANw/xNSKMlkLVB9R8oaCrDQQVjCdfsV3ZM
	 gdAH+qNAaQ1qlJctWMHw3ZbqQYZs1N/HGXiSjlM3oeMfR9sp+kZ0JUO05RlDPKiwKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WK7cwJEa;
	arc=none smtp.remote-ip=74.125.224.65
Received: from mail-yx1-f65.google.com (mail-yx1-f65.google.com [74.125.224.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43009606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 16:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43009606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WK7cwJEa
Received: by mail-yx1-f65.google.com with SMTP id 956f58d0204a3-67da7d18f2fso8100287d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711782; x=1796316582; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xn3AbwEHXU3sQNg1nNqXcaifYswIT1oFNQRvMaw2t3k=;
        b=WK7cwJEaW2j68ZLCs4NH1xptC+ha3+IkfiWHQ3+0algtFoph0I3GUZn/RQTzgu06Of
         ZHtr0dBbHh1SjuloWGgWtQzqnHGHbu1uz3LTvKWGd0L1MPjMLAwqpCm4kIV5KaV79k7o
         nOwlDFRNkpWbqKffTMq1eV1JxiR9cZvSU34X9fUOF0MFT6Ut4XJdWUOKSdSX3MxR3yqS
         TMsl9hjy0QPzgthQkZjNuFfH1K9zNPzItnyJ59yl6iufoB+queUPJ8sFM2oooAEPoAjG
         BuoLsQrrYAlkF9jvlB/f02bYFk2S88/zQisVkw6V8HsTmxIkZKO8CH7JGZ0jlFrGfW9b
         wZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711782; x=1796316582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xn3AbwEHXU3sQNg1nNqXcaifYswIT1oFNQRvMaw2t3k=;
        b=Nr2+NIImAt6SoyOJGJ4Kozfz1J/0ek0fACnsoWAIYhABaDg1e1FDDEmQhYTdeCVxz2
         7sx1ZqG7APHbIkrvKYOuxMxCQ1BJW87wZdKS6hPlqTqHgdNcoMwgxAMN5zdsA//1CZ6X
         dXx012mI6iu9eLJS2C26UuyzEODm6mlU/8jx8QEQ3HeK6u6FA/cBtHqf8PdBVFLL+lOt
         iKwFJWs6O98BffdZmb377UtnaeVGkawzEGPNcyetC2Yj0Mkp762b+ebEaNkdY1132zVb
         vHXTtAdvTZfmMMPCk49j3HZgcTWIgQZgHl94Ydf1YvGAxA0rUUG/A3uqaQ/H5xRBivsA
         D30A==
X-Gm-Message-State: APuU4Z+IyRocY15m3fBGVNuBZMHBSFwxSFOWUVb7e2kbq+EDLqZIekjN
	E6u+BBp4/2/PyY3x/OIIdMVgYmdd5dup39iH6b3tu/1xZwic53ZTFjtbjs/QjX6v
X-Gm-Gg: AZFdTZeKbVeaG5JjMSNE7ZlUBwhEo+5yUJPt59P3UW2qVACaw0c3zs0/Doo9HVXxzpT
	ellzsoeA1qvqHp7FKd4LiBcq4V1AJy4s6znt+5BS+0HRVkjUey7l6w360YVQGNoLpw0mp74XTO2
	h09g31P30DFNUWgn5X0Z4dNGVdMMbI8arKBsHyl/rnqREF/fyyn2GPgIoN06BRmSmxbRw7fXsD2
	cYTR/AiSfxVZoyuJOUnjwwg09o34w/poiAdP0tlYpSAOHBjb8R7nHpqe5WUq8dtWtQM8mlcb78S
	x5PrExuAdyM8BwQW/j0XXmPY4ixINtPQeXcuvtJR6ONBWzjBwkcmk0KjIt+Hgo/hTzuUw/F3C2O
	xHX1gYWuZkVcjobO2m3wMgDOu/XXcEGXVQdGG32a4rJHuO+aWfltWPOUm4OFcRlGvSr7thKnD3R
	toIg/Q7eqOqnhMmMqjGzuYO+jareXlN9BTAikhnjxK1xacq1niAQddUiDXb3Iz1xdLjMRLlAwZ0
	OxBrg7YcE2VYbt91ECsWAVsJcS/YSi0ACZ3GqQTnYjD97XauC1I9RRndNR4DZ/hdW+ROh6iQAzv
	AWCawg15hfChRlH+T25sYNqUBIsPeq5NH8+R
X-Received: by 2002:a53:ac93:0:b0:679:b8fe:a6f6 with SMTP id 956f58d0204a3-67dec48f5cemr8552044d50.33.1795711782318;
        Thu, 26 Nov 2026 08:49:42 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330bfb1sm10473400d50.6.2026.11.26.08.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:49:42 -0800 (PST)
Message-ID: <45f16f1a-66f7-4300-bffb-3d279b6c4bfb@gmail.com>
Date: Thu, 26 Nov 2026 11:49:40 -0500
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
Subject: Re: [PATCH v7 13/14] nvme-auth: link pre-provisioned keys into .nvme
 keyring
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>,
 Eric Biggers <ebiggers@kernel.org>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-nvme@lists.infradead.org, keyrings@vger.kernel.org
References: <20261126-dhchap-keyring-v4-v7-0-ee438ffea527@kernel.org>
 <20261126-dhchap-keyring-v4-v7-13-ee438ffea527@kernel.org>
 <sashiko-outbox-235710@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-235710@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 09:30, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does nvme_keyring_unlink() remove a pre-provisioned key that originally
> lived in the .nvme keyring or is shared across multiple controllers?

Hi Hannes,

I can confirm this one with a test. nvme-keysd adds the dhchap keys to
the .nvme keyring. After the first disconnect, or a failed connect,
the keys are gone from the keyring, and the next connect fails.

I think the kernel should not add keys to a keyring or remove them.
A pre-provisioned key is either in the keyring or it is not. If it is
not, the connect fails, and it is up to the user or the key manager to
fix that. While a controller uses the key, the reference it holds
(ctrl->host_key) keeps the key alive. So I do not think
nvme_keyring_link() and nvme_keyring_unlink() are needed for
pre-provisioned keys.

Otherwise the design works for nvme-keysd: each authentication reads
the key again, so a key the key manager updates in place reaches the
next authentication.

I will re-run the test on v8.

Thanks,
Martin
